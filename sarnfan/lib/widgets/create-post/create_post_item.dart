import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';

class CreatePostItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  const CreatePostItem(
      {super.key, required this.text, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 80,
        child: ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(AppColors.neu50),
              overlayColor: WidgetStateProperty.all<Color>(AppColors.neu200),
            ),
            onPressed: () {},
            icon: Icon(
              icon,
              color: color,
            ),
            label: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: color)),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: color,
                  size: 20,
                )
              ],
            )));
  }
}
