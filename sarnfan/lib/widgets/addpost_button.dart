import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarnfan/themes/color_theme.dart';

class AddPostButton extends StatelessWidget {
  const AddPostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: AppColors.neu400,
            offset: Offset(1, 1),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(23),
        // color: AppColors.sec600,
        gradient: const LinearGradient(
          colors: [AppColors.sec600, AppColors.sec300],
        ),
      ),
      child: IconButton(
        onPressed: () {
          context.go("/create-post");
        },
        icon: const Icon(
          Icons.add,
          size: 30,
          color: AppColors.neu50,
        ),
      ),
    );
    // IconButton(
    //     onPressed: () {
    //       context.go("/create-post");
    //     },
    //     color: AppColors.sec300,

    //     icon: Icon(Icons.add));
  }
}
