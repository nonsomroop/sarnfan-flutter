import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/bottom_nav.dart';
import 'package:sarnfan/widgets/create-post/post_list.dart';
import 'package:sarnfan/widgets/white_surface.dart';

class StarredPage extends StatelessWidget {
  const StarredPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNav(path: "/starred"),
      backgroundColor: AppColors.pri500,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 50.0, bottom: 40, left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.star_rate_rounded,
                      color: AppColors.neu50,
                      size: 35,
                    ),
                  ),
                  Text(
                    "Starred Posts",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: AppColors.neu50),
                  ),
                ],
              ),
            ),
            WhiteSurface(
                minHeight: MediaQuery.of(context).size.height - 185,
                child: const PostList(queryKey: "star",))
          ],
        ),
      ),
    );
  }
}
