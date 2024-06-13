class PostTag {
  final String color;
  final String name;

  const PostTag({
    required this.color,
    required this.name,
  });

  factory PostTag.fromJson(Map<String, dynamic> json) {
    return PostTag(
      color: json['Tag']['color'],
      name: json['Tag']['name'],
    );
  }
}
