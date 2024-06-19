// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sarnfan/models/post.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/profile_card.dart';
import 'package:sarnfan/widgets/tag.dart';
import 'package:sarnfan/widgets/white_surface.dart';

class PostDetailPage extends StatefulWidget {
  final String postId;
  const PostDetailPage({super.key, required this.postId});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late Post post;

  Future<void> getPostDetail() async {
    try {
      var response = await ApiService.get("/post/${widget.postId}");
      // if (response.statusCode == 200) {
      //   print(response.body);
      //   List<dynamic> data = jsonDecode(response.body);
      //   if (data.isEmpty) {
      //     return print("No data");
      //   }
      //   setState(() {
      //     post = data[0];
      //   });
      // } else {
      //   print('Failed to load posts: ${response.statusCode}');
      // }
    } catch (e) {
      print('Error loading posts: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getPostDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topLeft,
            children: [
              Positioned(
                // bottom: 300,
                child: SizedBox(
                  height: 250,
                  child: Image(
                    image: AssetImage("assets/images/school.png"),
                    // height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: AppColors.neu50,
                      )),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 200),
                  WhiteSurface(
                      minHeight: MediaQuery.of(context).size.height - 200,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  children: const [
                                    Tag(text: "saf"),
                                    Tag(text: "sfa")
                                  ],
                                ),
                                Wrap(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.report)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.star_border_rounded))
                                  ],
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 15),
                                child: Text(
                                  "07:00 PM 24 Jab 2024",
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: AppColors.neu600),
                                ),
                              ),
                            ),
                            ProfileCard(),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: SizedBox(
                                child: Text(
                                  "Place Holder",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: SizedBox(
                                child: Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse consequat mauris egestas ex interdum fermentum et eu tortor. Aliquam eu tristique sapien, vitae rutrum diam. Aliquam quis ipsum ex. Sed mauris arcu, rhoncus sed iaculis quis, consequat in sapien. Vivamus nibh ligula, iaculis quis molestie vel, pretium in mi. Mauris id orci eget sem efficitur commodo. Phasellus et magna in dui eleifend lobortis ac gravida elit. Cras consectetur, quam malesuada gravida consectetur, ante risus dictum ligula, at egestas sapien orci ut metus. Sed non euismod est. Sed magna dolor, convallis sit amet leo id, fermentum luctus risus. Curabitur malesuada ornare ultricies. Mauris dolor ipsum, pulvinar nec lorem "),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              child: Text(
                                "Location",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(color: AppColors.pri700),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/school.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              height: 180,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(top: 15, bottom: 20),
                                child: Text(
                                    "11/88 Suthisarn Rd. Phayathai Bangkok 10400"),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ],
          ),
          // WhiteSurface(
          //     child: Column(),
          //     minHeight: MediaQuery.of(context).size.height - 200),
        ],
      ),
    ));
  }
}
