import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarnfan/themes/color_theme.dart';

class ProfileItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final String path;
  const ProfileItem(
      {super.key, required this.text, required this.icon, required this.path});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 80,
        child: ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(AppColors.neu50),
              overlayColor: WidgetStateProperty.all<Color>(AppColors.neu200),
            ),
            onPressed: () {
              context.push(path);
            },
            icon: Icon(
              icon,
              color: AppColors.neu900,
            ),
            label: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text, style: Theme.of(context).textTheme.titleMedium),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.neu900,
                  size: 20,
                )
              ],
            )));
  }
}
