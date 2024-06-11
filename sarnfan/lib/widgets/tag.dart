import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';

class Tag extends StatelessWidget {
  final String text;
  const Tag({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 100),
      child: Container(
          // width: 90,
          height: 25,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              color: AppColors.pri600, borderRadius: BorderRadius.circular(30)),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: AppColors.neu50),
          )),
    );
  }
}
