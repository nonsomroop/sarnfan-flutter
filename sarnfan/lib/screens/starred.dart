import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/bottom_nav.dart';
import 'package:sarnfan/widgets/post_card.dart';
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
              child: Text(
                "Starred Posts",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: AppColors.neu50),
              ),
            ),
            WhiteSurface(
                minHeight: MediaQuery.of(context).size.height -185,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(children: [
                    PostCard(
                        id: 123,
                        title: "hello",
                        content: "asfl;asfjaslfj;afk;afja",
                        date: "safaf",
                        tags: [])
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}
