import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/post_card.dart';
import 'package:sarnfan/widgets/white_surface.dart';

class OtherHistoryPage extends StatelessWidget {
  const OtherHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.neu50,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.pri500,
      ),
      backgroundColor: AppColors.pri500,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 30, left: 20, right: 20),
              child: Text(
                "Post History",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: AppColors.neu50),
              ),
            ),
            WhiteSurface(
                minHeight: MediaQuery.of(context).size.height - 80,
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
