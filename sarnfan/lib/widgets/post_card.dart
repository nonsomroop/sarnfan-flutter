import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarnfan/models/post_tag.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/tag.dart';

class PostCard extends StatefulWidget {
  final num id;
  final String title;
  final String content;
  final String date;
  final List<PostTag> tags;
  const PostCard(
      {super.key,
      required this.id,
      required this.title,
      required this.content,
      required this.date,
      required this.tags});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, "/post/${widget.id}");
        context.go("/post-detail/${widget.id}");
      },
      child: Container(
        height: 180,
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.neu50, borderRadius: BorderRadius.circular(30)),
        child: Row(children: [
          Stack(
            children: [
              Container(
                width: 120,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/school.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        color: AppColors.neu50,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        )),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Expanded(
                  child: Text(
                    widget.content,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Text(
                  widget.date,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.neu600,
                      ),
                ),
                const SizedBox(height: 5),
                Row(
                    children: widget.tags.map((tag) {
                  return Flexible(
                      child: Tag(
                    text: tag.name,
                  ));
                }).toList())
              ],
            ),
          )
        ]),
      ),
    );
  }
}
