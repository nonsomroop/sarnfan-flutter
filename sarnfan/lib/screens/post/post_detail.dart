// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sarnfan/models/post.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/profile_card.dart';
import 'package:sarnfan/widgets/tag.dart';
import 'package:sarnfan/widgets/white_surface.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sarnfan/functions/format_date_time.dart';

class PostDetailPage extends StatefulWidget {
  final String postId;
  const PostDetailPage({super.key, required this.postId});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  OtherPost? post;
  bool _isLoading = true;

  Future<void> getPostDetail() async {
    try {
      var response = await ApiService.get("/post/${widget.postId}");
      if (response.statusCode == 200) {
        // print(response.body);
        final data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          setState(() {
            post = OtherPost.fromJson(data);
            _isLoading = false;
          });
        }
        return;
      } else {
        print('Failed to load posts: ${response.statusCode}');
        _isLoading = false;
      }
    } catch (e) {
      print('Error loading posts: $e');
      _isLoading = false;
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
                        child: Skeletonizer(
                          enabled: _isLoading,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                    children: post?.tags
                                            .map((tag) => Tag(
                                                  text: tag.name,
                                                ))
                                            .toList() ??
                                        [],
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
                                    formatDateTime(post?.createdDate ?? ""),
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: AppColors.neu600),
                                  ),
                                ),
                              ),
                              ProfileCard(
                                picture: post?.owner.picture ?? "-",
                                email: post?.owner.email ?? "-",
                                username: post?.owner.username ?? "-",
                                phone: post?.owner.phone ?? "-",
                                social: post?.owner.social ?? "-",
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: SizedBox(
                                  child: Text(
                                    post?.title ?? "-",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: SizedBox(
                                  child: Text(
                                    post?.content ?? "-",
                                  ),
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
                                height: 300,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: AppColors.neu200),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child:
                                    // _isLoading
                                    //     ? const CircularLoader()
                                    //     :
                                    FlutterMap(
                                  options: MapOptions(
                                    initialCenter: LatLng(post?.latitude ?? 0,
                                        post?.longitude ?? 0),
                                    initialZoom: 15,
                                  ),
                                  children: [
                                    TileLayer(
                                      urlTemplate:
                                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                      userAgentPackageName: 'com.example.app',
                                    ),
                                    MarkerLayer(markers: [
                                      Marker(
                                          point: LatLng(post?.latitude ?? 0,
                                              post?.longitude ?? 0),
                                          child: Icon(
                                            Icons.location_on_rounded,
                                            color: AppColors.red500,
                                          ))
                                    ])
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
