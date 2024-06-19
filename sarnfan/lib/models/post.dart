import 'package:sarnfan/models/post_tag.dart';

class Post {
  final num id;
  final String title;
  final String content;
  final String createdDate;
  final double? latitude;
  final double? longitude;
  final List<PostTag> tags;

  const Post({
    required this.id,
    required this.title,
    required this.content,
    required this.createdDate,
    required this.tags,
    this.latitude,
    this.longitude,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      createdDate: json['created_date'],
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      tags: (json['Post_Tag'] as List<dynamic>)
          .map((tagJson) => PostTag.fromJson(tagJson))
          .toList(),
    );
  }
}
