import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sarnfan/models/post.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/post_card.dart';
import 'package:sarnfan/widgets/post_load.dart';

class PostList extends StatefulWidget {
  final String? queryKey;
  final String? queryData;
  const PostList({super.key, this.queryKey, this.queryData});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  late List<Post> postList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    switch (widget.queryKey) {
      case "star":
        getPost("getstared");
        break;
      case "history":
        getPost("getpost");
        break;
      case "other-history":
        getPost("other/post", widget.queryData);
        break;
      default:
        getPost("getpost");
    }
  }

  Future<void> getPost(String path, [String? data]) async {
    try {
      Response response;
      if (data == null) {
        response = await ApiService.get("/user/$path");
      } else {
        Map<String, dynamic> postData = {"username": data};
        response = await ApiService.post("/$path", postData);
      }
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        if (data.isEmpty) {
          print("No data");
        }
        setState(() {
          postList = data.map((postJson) => Post.fromJson(postJson)).toList();
          _isLoading = false;
        });
      } else {
        print('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading posts: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            PostLoad(),
            PostLoad(),
            PostLoad(),
          ]));
    } else {
      if (postList.isEmpty) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Text(
              "No post found",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.neu700),
            ),
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: postList.map((post) {
              return PostCard(
                id: post.id,
                picture: (post.images != null &&
                        post.images!.isNotEmpty &&
                        post.images![0] != null &&
                        post.images![0]["link"] != null)
                    ? post.images![0]["link"]
                    : "",
                title: post.title,
                content: post.content,
                date: post.createdDate,
                tags: post.tags,
              );
            }).toList(),
          ),
        );
      }
    }
  }
}
