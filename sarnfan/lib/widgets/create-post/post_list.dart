import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sarnfan/models/post.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:sarnfan/widgets/post_card.dart';
import 'package:sarnfan/widgets/post_load.dart';

class PostList extends StatefulWidget {
  final String? queryKey;
  const PostList({this.queryKey, super.key});

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
    }
  }

  Future<void> getPost(String path) async {
    try {
      var response = await ApiService.get("/user/$path");
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
      return Padding(
        padding: const EdgeInsets.all(20),
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
      );
    }
  }
}
