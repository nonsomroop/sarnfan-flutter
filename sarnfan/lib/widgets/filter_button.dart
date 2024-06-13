import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  const FilterButton({super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5, left: 5),
      child: SizedBox(
        height: 90,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 80, maxWidth: 100),
          child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: WidgetStateProperty.all(const EdgeInsets.all(5)),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0))),
                // fixedSize: WidgetStateProperty.all(Size(80, 80)),

                backgroundColor: isSelected
                    ? WidgetStateProperty.all(AppColors.sec600)
                    : WidgetStateProperty.all(AppColors.sec300),
              ),
              child: Text(text,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: AppColors.neu50))),
        ),
      ),
    );
  }
}
