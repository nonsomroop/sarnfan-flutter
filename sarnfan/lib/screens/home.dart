import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/addpost_button.dart';
import 'package:sarnfan/widgets/bottom_nav.dart';
import 'package:sarnfan/widgets/post_card.dart';
import 'package:sarnfan/widgets/white_surface.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const AddPostButton(),
      bottomNavigationBar: const BottomNav(path: "/home"),
      body: Container(
        color: AppColors.pri500,
        child: Column(
          children: [
            Container(
              child: Text(
                'Home Page',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: AppColors.neu900,
                    ),
              ),
            ),
            WhiteSurface(
                minHeight: MediaQuery.of(context).size.height / 1.5,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 20),
                          child: Text(
                            'Recent Posts',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: AppColors.neu900,
                                ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Wrap(
                          children: [
                            PostCard(
                              title:
                                  "Need improvement for playground (painting)",
                              content:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse consequat mauris egestas ex interdum fermentum et eu tortor. Aliquam eu tristique sapien, vitae rutrum diam. Aliquam quis ipsum ex. Sed mauris arcu, rhoncus sed iaculis quis, consequat in sapien. Vivamus nibh ligula, iaculis quis molestie vel, pretium in mi. Mauris id orci eget sem efficitur commodo. Phasellus et magna in dui eleifend lobortis ac gravida elit. Cras consectetur, quam malesuada gravida consectetur, ante risus dictum ligula, at egestas sapien orci ut metus. Sed non euismod est. Sed magna dolor, convallis sit amet leo id, fermentum luctus risus. Curabitur malesuada ornare ultricies. Mauris dolor ipsum, pulvinar nec lorem ",
                              date: "07:00, 24 Jan 2024",
                              tags: ["school", "volunteer", "northern"],
                            ),
                            PostCard(
                              title:
                                  "Need improvement for playground (painting)",
                              content:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse consequat mauris egestas ex interdum fermentum et eu tortor. Aliquam eu tristique sapien, vitae rutrum diam. Aliquam quis ipsum ex. Sed mauris arcu, rhoncus sed iaculis quis, consequat in sapien. Vivamus nibh ligula, iaculis quis molestie vel, pretium in mi. Mauris id orci eget sem efficitur commodo. Phasellus et magna in dui eleifend lobortis ac gravida elit. Cras consectetur, quam malesuada gravida consectetur, ante risus dictum ligula, at egestas sapien orci ut metus. Sed non euismod est. Sed magna dolor, convallis sit amet leo id, fermentum luctus risus. Curabitur malesuada ornare ultricies. Mauris dolor ipsum, pulvinar nec lorem ",
                              date: "07:00, 24 Jan 2024",
                              tags: ["school", "volunteer", "northern"],
                            ),
                            PostCard(
                              title:
                                  "Need improvement for playground (painting)",
                              content:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse consequat mauris egestas ex interdum fermentum et eu tortor. Aliquam eu tristique sapien, vitae rutrum diam. Aliquam quis ipsum ex. Sed mauris arcu, rhoncus sed iaculis quis, consequat in sapien. Vivamus nibh ligula, iaculis quis molestie vel, pretium in mi. Mauris id orci eget sem efficitur commodo. Phasellus et magna in dui eleifend lobortis ac gravida elit. Cras consectetur, quam malesuada gravida consectetur, ante risus dictum ligula, at egestas sapien orci ut metus. Sed non euismod est. Sed magna dolor, convallis sit amet leo id, fermentum luctus risus. Curabitur malesuada ornare ultricies. Mauris dolor ipsum, pulvinar nec lorem ",
                              date: "07:00, 24 Jan 2024",
                              tags: ["school", "volunteer", "northern"],
                            ),
                            PostCard(
                              title:
                                  "Need improvement for playground (painting)",
                              content:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse consequat mauris egestas ex interdum fermentum et eu tortor. Aliquam eu tristique sapien, vitae rutrum diam. Aliquam quis ipsum ex. Sed mauris arcu, rhoncus sed iaculis quis, consequat in sapien. Vivamus nibh ligula, iaculis quis molestie vel, pretium in mi. Mauris id orci eget sem efficitur commodo. Phasellus et magna in dui eleifend lobortis ac gravida elit. Cras consectetur, quam malesuada gravida consectetur, ante risus dictum ligula, at egestas sapien orci ut metus. Sed non euismod est. Sed magna dolor, convallis sit amet leo id, fermentum luctus risus. Curabitur malesuada ornare ultricies. Mauris dolor ipsum, pulvinar nec lorem ",
                              date: "07:00, 24 Jan 2024",
                              tags: ["school", "volunteer", "northern"],
                            ),
                            PostCard(
                              title:
                                  "Need improvement for playground (painting)",
                              content:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse consequat mauris egestas ex interdum fermentum et eu tortor. Aliquam eu tristique sapien, vitae rutrum diam. Aliquam quis ipsum ex. Sed mauris arcu, rhoncus sed iaculis quis, consequat in sapien. Vivamus nibh ligula, iaculis quis molestie vel, pretium in mi. Mauris id orci eget sem efficitur commodo. Phasellus et magna in dui eleifend lobortis ac gravida elit. Cras consectetur, quam malesuada gravida consectetur, ante risus dictum ligula, at egestas sapien orci ut metus. Sed non euismod est. Sed magna dolor, convallis sit amet leo id, fermentum luctus risus. Curabitur malesuada ornare ultricies. Mauris dolor ipsum, pulvinar nec lorem ",
                              date: "07:00, 24 Jan 2024",
                              tags: ["school", "volunteer", "northern"],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
