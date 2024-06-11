import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pri500,
      floatingActionButton: const AddPostButton(),
      bottomNavigationBar: const BottomNav(path: "/home"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(top: 10, right: 10),
                  decoration: BoxDecoration(
                      color: AppColors.neu100,
                      borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                    onPressed: () {
                      context.go("/search");
                    },
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.pri500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              )
            ]),
            WhiteSurface(
              minHeight: MediaQuery.of(context).size.height - 159,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: MediaQuery.of(context).size.width / 2 - 50,
                    top: -50,
                    child: Container(
                      child: Wrap(
                        direction: Axis.vertical,
                        alignment: WrapAlignment.center,
                        spacing: 10,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/images/school.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            width: 100,
                            height: 100,
                            alignment: Alignment.center,
                          ),
                          Text("John Doe",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 90, left: 20),
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
                        child: Column(
                          children: [
                            PostCard(
                              title:
                                  "Need improvement for playground (painting)",
                              content:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse consequat mauris egestas ex interdum fermentum et eu tortor. Aliquam eu tristique sapien, vitae rutrum diam. Aliquam quis ipsum ex. Sed mauris arcu, rhoncus sed iaculis quis, consequat in sapien. Vivamus nibh ligula, iaculis quis molestie vel, pretium in mi. Mauris id orci eget sem efficitur commodo. Phasellus et magna in dui eleifend lobortis ac gravida elit. Cras consectetur, quam malesuada gravida consectetur, ante risus dictum ligula, at egestas sapien orci ut metus. Sed non euismod est. Sed magna dolor, convallis sit amet leo id, fermentum luctus risus. Curabitur malesuada ornare ultricies. Mauris dolor ipsum, pulvinar nec lorem ",
                              date: "07:00, 24 Jan 2024",
                              tags: ["volunteer", "northern"],
                            ),
                            PostCard(
                              title:
                                  "Need improvement for playground (painting)",
                              content:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse consequat mauris egestas ex interdum fermentum et eu tortor. Aliquam eu tristique sapien, vitae rutrum diam. Aliquam quis ipsum ex. Sed mauris arcu, rhoncus sed iaculis quis, consequat in sapien. Vivamus nibh ligula, iaculis quis molestie vel, pretium in mi. Mauris id orci eget sem efficitur commodo. Phasellus et magna in dui eleifend lobortis ac gravida elit. Cras consectetur, quam malesuada gravida consectetur, ante risus dictum ligula, at egestas sapien orci ut metus. Sed non euismod est. Sed magna dolor, convallis sit amet leo id, fermentum luctus risus. Curabitur malesuada ornare ultricies. Mauris dolor ipsum, pulvinar nec lorem ",
                              date: "07:00, 24 Jan 2024",
                              tags: ["volunteer", "northern"],
                            ),
                            PostCard(
                              title:
                                  "Need improvement for playground (painting)",
                              content:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse consequat mauris egestas ex interdum fermentum et eu tortor. Aliquam eu tristique sapien, vitae rutrum diam. Aliquam quis ipsum ex. Sed mauris arcu, rhoncus sed iaculis quis, consequat in sapien. Vivamus nibh ligula, iaculis quis molestie vel, pretium in mi. Mauris id orci eget sem efficitur commodo. Phasellus et magna in dui eleifend lobortis ac gravida elit. Cras consectetur, quam malesuada gravida consectetur, ante risus dictum ligula, at egestas sapien orci ut metus. Sed non euismod est. Sed magna dolor, convallis sit amet leo id, fermentum luctus risus. Curabitur malesuada ornare ultricies. Mauris dolor ipsum, pulvinar nec lorem ",
                              date: "07:00, 24 Jan 2024",
                              tags: ["volunteer", "northern"],
                            ),
                            PostCard(
                              title:
                                  "Need improvement for playground (painting)",
                              content:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse consequat mauris egestas ex interdum fermentum et eu tortor. Aliquam eu tristique sapien, vitae rutrum diam. Aliquam quis ipsum ex. Sed mauris arcu, rhoncus sed iaculis quis, consequat in sapien. Vivamus nibh ligula, iaculis quis molestie vel, pretium in mi. Mauris id orci eget sem efficitur commodo. Phasellus et magna in dui eleifend lobortis ac gravida elit. Cras consectetur, quam malesuada gravida consectetur, ante risus dictum ligula, at egestas sapien orci ut metus. Sed non euismod est. Sed magna dolor, convallis sit amet leo id, fermentum luctus risus. Curabitur malesuada ornare ultricies. Mauris dolor ipsum, pulvinar nec lorem ",
                              date: "07:00, 24 Jan 2024",
                              tags: ["volunteer", "northern"],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
