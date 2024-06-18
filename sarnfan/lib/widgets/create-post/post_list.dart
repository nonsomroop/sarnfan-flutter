import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sarnfan/models/post.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:sarnfan/widgets/post_card.dart';

class PostList extends StatefulWidget {
  final String? queryKey;
  const PostList({this.queryKey, super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  late List<Post> postList = [];

  @override
  void initState() {
    super.initState();
    switch (widget.queryKey) {
      case "star":
        getStarredPosts();
        break;
      case "history":
        getHistoryPosts();
        break;
    }
  }

  Future<void> getStarredPosts() async {}

  Future<void> getHistoryPosts() async {}

  @override
  Widget build(BuildContext context) {
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
