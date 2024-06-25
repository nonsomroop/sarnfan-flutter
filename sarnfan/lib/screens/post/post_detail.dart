import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:sarnfan/models/post_detail.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/profile_card.dart';
import 'package:sarnfan/widgets/report_post.dart';
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
  PostDetail? post;
  String? _image;
  bool _isLoading = true;
  bool _isStar = false;

  Future<void> getPostDetail() async {
    try {
      var response = await ApiService.get("/user/post/${widget.postId}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        var favourites = data['Favourite'] as List<dynamic>;
        var images = data["Post_Image"] as List<dynamic>;
        if (data != null) {
          setState(() {
            post = PostDetail.fromJson(data, favourites.isNotEmpty);
            _isLoading = false;
            _isStar = favourites.isNotEmpty;
            _image = images[0]["link"];
          });
        }
        return;
      } else {
        print('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading posts: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> starClick() async {
    try {
      if (post == null) {
        print('Error: No post loaded');
        return;
      }
      var data = {"post_id": post?.id ?? -1};
      var response = await ApiService.post("/user/star", data);
      if (response.statusCode == 200) {
        setState(() {
          _isStar = !_isStar;
        });
      }
    } catch (e) {
      print('Error starring post: $e');
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
                child: SizedBox(
                  height: 250,
                  child: Skeletonizer(
                    containersColor: AppColors.green,
                    enabled: _isLoading,
                    child: Image.network(
                      ApiService.serverImage("/posts/$_image"),
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Image(
                        image: AssetImage("assets/images/school.png"),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      context.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.neu50,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 200),
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
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return ReportPost(
                                                    post: post?.id ?? -1);
                                              });
                                        },
                                        icon: const Icon(Icons.report),
                                      ),
                                      IconButton(
                                        onPressed: starClick,
                                        icon: Icon(
                                          _isStar
                                              ? Icons.star
                                              : Icons.star_border_rounded,
                                          color: _isStar
                                              ? Colors.amber
                                              : AppColors.grey,
                                        ),
                                      ),
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
                                picture: post?.owner.picture ?? "",
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
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 10),
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
                                child: FlutterMap(
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
                                          child: const Icon(
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
