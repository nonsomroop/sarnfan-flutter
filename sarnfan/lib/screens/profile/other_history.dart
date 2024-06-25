import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/create-post/post_list.dart';
import 'package:sarnfan/widgets/white_surface.dart';

class OtherHistoryPage extends StatelessWidget {
  final String? username;
  const OtherHistoryPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.neu50,
          ),
          onPressed: () {
            context.pop(context);
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
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.history,
                    color: AppColors.neu50,
                    size: 30,
                  ),
                ),
                Text(
                  "Post History",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: AppColors.neu50),
                ),
              ]),
            ),
            WhiteSurface(
                minHeight: MediaQuery.of(context).size.height - 146,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    PostList(
                      queryKey: "other-history",
                      queryData: username ?? "",
                    )
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}
