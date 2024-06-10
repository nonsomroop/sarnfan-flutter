import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';

class WhiteSurface extends StatelessWidget {
  final Widget child;
  final double minHeight;
  const WhiteSurface({super.key, required this.child, required this.minHeight});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: minHeight),
        decoration: const BoxDecoration(
            color: AppColors.neu100,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: child,
      ),
    );
  }
}
