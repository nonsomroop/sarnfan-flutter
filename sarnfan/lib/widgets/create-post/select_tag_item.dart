import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';

class SelectTagItem extends StatefulWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  const SelectTagItem(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onTap});

  @override
  State<SelectTagItem> createState() => _SelectTagItemState();
}

class _SelectTagItemState extends State<SelectTagItem> {
  @override
  

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 100),
        child: Container(
            // width: 90,
            height: 35,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                color: widget.isSelected ? AppColors.sec600 : AppColors.sec300,
                borderRadius: BorderRadius.circular(30)),
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: AppColors.neu50),
            )),
      ),
    );
  }
}
