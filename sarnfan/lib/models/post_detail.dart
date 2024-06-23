import 'package:sarnfan/models/owner.dart';
import 'package:sarnfan/models/post_tag.dart';

class PostDetail {
  final num id;
  final String title;
  final String content;
  final String createdDate;
  final double? latitude;
  final double? longitude;
  final Owner owner;
  final bool star;
  final List<PostTag> tags;

  PostDetail({
    required this.id,
    required this.title,
    required this.content,
    required this.createdDate,
    required this.owner,
    required this.tags,
    required this.star,
    this.latitude,
    this.longitude,
  });

  factory PostDetail.fromJson(Map<String, dynamic> json, bool userFavorited) {
    var ownerJson = json['User'];
    print(json["id"]);
    return PostDetail(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      createdDate: json['created_date'],
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      owner: Owner.fromJson(ownerJson),
      star: userFavorited,
      tags: (json['Post_Tag'] as List<dynamic>)
          .map((tagJson) => PostTag.fromJson(tagJson))
          .toList(),
    );
  }
}
