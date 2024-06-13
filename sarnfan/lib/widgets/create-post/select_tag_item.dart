import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';

class SelectTagItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  const SelectTagItem(
      {super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 100),
      child: Container(
          // width: 90,
          height: 35,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              color: isSelected ? AppColors.sec600 : AppColors.sec300,
              borderRadius: BorderRadius.circular(30)),
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
