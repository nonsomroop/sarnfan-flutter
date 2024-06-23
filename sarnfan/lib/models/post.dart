import 'package:sarnfan/models/post_tag.dart';
import 'package:sarnfan/models/user.dart';

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

class OtherPost extends Post {
  User owner;

  OtherPost(
      {required super.id,
      required super.title,
      required super.content,
      required super.createdDate,
      required super.tags,
      super.latitude,
      super.longitude,
      required this.owner});

  factory OtherPost.fromJson(Map<String, dynamic> json) {
    return OtherPost(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      createdDate: json['created_date'],
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      tags: (json['Post_Tag'] as List<dynamic>)
          .map((tagJson) => PostTag.fromJson(tagJson))
          .toList(),
      owner: User.fromJson(json['User']),
    );
  }
}
