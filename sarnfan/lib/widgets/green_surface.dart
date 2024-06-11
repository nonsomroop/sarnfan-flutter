import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';

class GreenSurface extends StatelessWidget {
  final Widget child;
  final double minHeight;
  const GreenSurface({super.key, required this.child, required this.minHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: minHeight),
      decoration: const BoxDecoration(
          color: AppColors.pri500,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )),
      child: child,
    );
  }
}
