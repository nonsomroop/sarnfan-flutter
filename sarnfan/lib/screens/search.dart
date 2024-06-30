import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarnfan/models/post.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/filter_button.dart';
import 'package:sarnfan/widgets/post_card.dart';
import 'package:sarnfan/widgets/search_bar.dart';
import 'package:sarnfan/widgets/white_surface.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<OtherPost> postList = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getAllPosts();
  }

  Future<void> getAllPosts() async {
    try {
      var response = await ApiService.get("/post");
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        if (data.isEmpty) {
          return print("No data");
        }
        setState(() {
          postList =
              data.map((postJson) => OtherPost.fromJson(postJson)).toList();
          filteredPostList = postList;
          _isLoading = false;
        });
      } else {
        print('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading posts: $e');
    }
  }

  var activityValue = 'All';
  var activities = ['All', 'Volunteer', 'Donation', 'Workshop', 'Other'];
  var regionValue = 'All';
  var regions = [
    'All',
    'Central',
    'Nortern',
    'Northerneast',
    'Eastern',
    'Western',
    'Southern'
  ];
  var typeValue = 'All';
  var types = ['All', 'school', 'org', 'ind'];
  final TextEditingController _searchController = TextEditingController();
  List<Post> filteredPostList = [];

  dynamic _searchKeyword(String keyword) {
    setState(() {
      filterPosts();
    });
  }

  void filterPosts() {
    setState(() {
      filteredPostList = postList.where((post) {
        final matchesKeyword = post.title.contains(_searchController.text) ||
            post.content.contains(_searchController.text);

        final matchesType = typeValue == 'All' || post.owner.type == typeValue;
        bool matchesActivity = false;
        for (var tag in post.tags) {
          if (tag.name == activityValue || activityValue == 'All') {
            matchesActivity = true;
            break;
          }
        }
        bool matchesRegion = false;
        for (var tag in post.tags) {
          if (tag.name == regionValue || regionValue == 'All') {
            matchesRegion = true;
            break;
          }
        }
        return matchesKeyword &&
            matchesType &&
            matchesActivity &&
            matchesRegion;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.pri500,
        appBar: AppBar(
          backgroundColor: AppColors.pri500,
          foregroundColor: AppColors.neu50,
          titleSpacing: 5,
          leading: IconButton(
            // padding: const EdgeInsets.only(left: 20),
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.go("/home");
            },
          ),
          title: Text('Search',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppColors.neu50)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                child: SearchField(
                    controller: _searchController,
                    searchKeyword: _searchKeyword),
              ),
              const SizedBox(
                height: 20,
              ),
              WhiteSurface(
                  minHeight: MediaQuery.of(context).size.height - 164,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: types.map((type) {
                            final typeFormat = type == 'school'
                                ? 'School'
                                : type == 'org'
                                    ? 'Campaign'
                                    : type == 'ind'
                                        ? 'Individual'
                                        : 'All';
                            return Expanded(
                              flex: 1,
                              child: GestureDetector(
                                child: FilterButton(
                                  text: typeFormat,
                                  isSelected: type == typeValue,
                                  onTap: () {
                                    setState(() {
                                      typeValue = type;
                                      filterPosts();
                                    });
                                  },
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              bottom: 20, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Select Activity",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    DropdownMenu(
                                      width: MediaQuery.of(context).size.width *
                                          0.42,
                                      onSelected: (activity) => {
                                        if (activity != null)
                                          {
                                            setState(() {
                                              activityValue = activity;
                                              filterPosts();
                                            }),
                                          }
                                      },
                                      initialSelection: "All",
                                      dropdownMenuEntries:
                                          activities.map((option) {
                                        return DropdownMenuEntry(
                                            value: option, label: option);
                                      }).toList(),
                                    ),
                                  ]),
                              // SizedBox(width: 20),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Select Region",
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    DropdownMenu(
                                      width: MediaQuery.of(context).size.width *
                                          0.42,
                                      onSelected: (region) => {
                                        if (region != null)
                                          {
                                            setState(() {
                                              regionValue = region;
                                              filterPosts();
                                            }),
                                          }
                                      },
                                      initialSelection: "All",
                                      dropdownMenuEntries:
                                          regions.map((option) {
                                        return DropdownMenuEntry(
                                            value: option, label: option);
                                      }).toList(),
                                    ),
                                  ])
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 20, right: 20),
                        child: Text(
                          "Search Results",
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Skeletonizer(
                        enabled: _isLoading,
                        child: Column(
                            children: filteredPostList.map((post) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            child: PostCard(
                                id: post.id,
                                isLoading: _isLoading,
                                picture: post.images?.isNotEmpty == true
                                    ? post.images![0]["link"]
                                    : "",
                                title: post.title,
                                content: post.content,
                                date: post.createdDate,
                                tags: post.tags),
                          );
                        }).toList()),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
