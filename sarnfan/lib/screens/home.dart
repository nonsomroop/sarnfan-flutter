import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sarnfan/models/post.dart';
import 'package:sarnfan/providers/app_provider.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/addpost_button.dart';
import 'package:sarnfan/widgets/bottom_nav.dart';
import 'package:sarnfan/widgets/post_card.dart';
import 'package:sarnfan/widgets/post_load.dart';
import 'package:sarnfan/widgets/white_surface.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Post> postList = [];
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
          postList = data.map((postJson) => Post.fromJson(postJson)).toList();
          _isLoading = false;
        });
        print(postList);
      } else {
        print('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading posts: $e');
    }
  }

  static final backendUrl =
      dotenv.env["BACKEND_URL"] ?? "http://localhost:4000";
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.pri500,
      floatingActionButton: const AddPostButton(),
      bottomNavigationBar: const BottomNav(path: "/home"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(top: 10, right: 10),
                  decoration: BoxDecoration(
                      color: AppColors.neu100,
                      borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                    onPressed: () {
                      context.go("/search");
                    },
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.pri500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              )
            ]),
            WhiteSurface(
              minHeight: MediaQuery.of(context).size.height - 159,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: -50,
                    child: Skeletonizer(
                      enabled: _isLoading,
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            width: 100,
                            height: 100,
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: appProvider.picture != null
                                  ? NetworkImage(
                                      "$backendUrl/pic/profiles/${appProvider.picture}")
                                  : const AssetImage(
                                      "assets/images/profile.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(appProvider.username ?? "",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleMedium),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 90, left: 20),
                            child: Text(
                              'Recent Posts',
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    color: AppColors.neu900,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Skeletonizer(
                            enabled: _isLoading,
                            child: Column(
                              children: _isLoading == true
                                  ? const [PostLoad(), PostLoad(), PostLoad()]
                                  : (postList.map((post) {
                                      return GestureDetector(
                                        onTap: () {
                                          context.go("/post-detail/${post.id}");
                                        },
                                        child: PostCard(
                                          id: post.id,
                                          isLoading: _isLoading,
                                          picture:
                                              post.images?.isNotEmpty == true
                                                  ? post.images![0]["link"]
                                                  : "",
                                          title: post.title,
                                          content: post.content,
                                          date: post.createdDate,
                                          tags: post.tags,
                                        ),
                                      );
                                    }).toList()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
