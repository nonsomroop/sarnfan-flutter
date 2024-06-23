import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PostLoad extends StatelessWidget {
  const PostLoad({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.neu50, borderRadius: BorderRadius.circular(30)),
        child: Skeletonizer(
          child: Row(children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: const Skeleton.replace(
                      width: 120,
                      height: 150,
                      child: Icon(Icons.ac_unit, size: 40),
                    )),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SAMPLE TEXT",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Expanded(
                    child: Text(
                      "SAMPLE TEXT SAMPLE TEXT SAMPLE TEXT SAMPLE TEXT SAMPLE TEXT",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Text(
                    "SAMPLE NAME",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.neu600,
                        ),
                  ),
                  const SizedBox(height: 5),
                  const Row()
                ],
              ),
            )
          ]),
        ));
  }
}
