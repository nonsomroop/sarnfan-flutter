import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sarnfan/models/post.dart';
import 'package:sarnfan/providers/app_provider.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/addpost_button.dart';
import 'package:sarnfan/widgets/bottom_nav.dart';
import 'package:sarnfan/widgets/post_card.dart';
import 'package:sarnfan/widgets/white_surface.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Post> postList = [];

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
        setState(() {
          postList = data.map((postJson) => Post.fromJson(postJson)).toList();
        });
        print(postList);
      } else {
        print('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading posts: $e');
    }
  }

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
                      context.push("/search");
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
                children: [
                  Positioned(
                    left: MediaQuery.of(context).size.width / 2 - 50,
                    top: -50,
                    child: SizedBox(
                      child: Wrap(
                        direction: Axis.vertical,
                        alignment: WrapAlignment.center,
                        spacing: 10,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/images/school.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: 100,
                            height: 100,
                            alignment: Alignment.center,
                          ),
                          Text(appProvider.username ?? "",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                  ),
                  Column(
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
                        child: Column(
                          children: postList.map((post) {
                            return PostCard(
                              id: post.id,
                              title: post.title,
                              content: post.content,
                              date: post.createdDate,
                              tags: post.tags,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
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
