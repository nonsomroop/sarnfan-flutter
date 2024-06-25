import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarnfan/themes/color_theme.dart';

class FAQItem extends StatelessWidget {
  final String path;
  final String text;
  const FAQItem({super.key, required this.path, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 20, bottom: 20),
      child: ElevatedButton(
        onPressed: () {
          context.push(path);
        },
        style: ButtonStyle(
          fixedSize:
              WidgetStateProperty.all<Size>(const Size(double.maxFinite, 120)),
          backgroundColor: WidgetStateProperty.all<Color>(AppColors.pri500),
        ),
        child: Text(text,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.neu50,
                )),
      ),
    );
  }
}
