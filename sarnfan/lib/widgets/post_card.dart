import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/tag.dart';

class PostCard extends StatefulWidget {
  final String title;
  final String content;
  final String date;
  final List<String> tags;
  const PostCard(
      {super.key,
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
    return Container(
      height: 180,
      
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.neu50, borderRadius: BorderRadius.circular(30)),
      child: Row(children: [
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
              Wrap(
                children: [
                  Tag(
                    text: widget.tags[0],
                  ),
                  Tag(
                    text: widget.tags[1],
                  ),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
