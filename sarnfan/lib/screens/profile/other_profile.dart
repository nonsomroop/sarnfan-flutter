import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sarnfan/models/user.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/bottom_nav.dart';
import 'package:sarnfan/widgets/green_surface.dart';
import 'package:sarnfan/widgets/profile_item.dart';
import 'package:sarnfan/widgets/user_type.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OtherProfilePage extends StatefulWidget {
  // final String userId;
  const OtherProfilePage({
    super.key,
    //  required this.userId
  });

  @override
  State<OtherProfilePage> createState() => _OtherProfilePageState();
}

class _OtherProfilePageState extends State<OtherProfilePage> {
  User? userData;
  bool _isLoading = true;
  Future<void> getOtherUser() async {
    try {
      var response = await ApiService.post("/other/user", {
        "username": "Chanakarn Limprasertsiri",
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data.isNotEmpty) {
          setState(() {
            userData = User.fromJson(data);
            _isLoading = false;
          });
        }
      } else {
        print('Failed to load user: ${response.statusCode}');
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error loading user: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getOtherUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: AppColors.neu50,
              )),
          backgroundColor: AppColors.pri500,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Skeletonizer(
                enabled: _isLoading,
                child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      GreenSurface(
                          minHeight: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: AppColors.neu50,
                                    borderRadius: BorderRadius.circular(100),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/profile.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    userData?.username ?? "-",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(color: AppColors.neu50),
                                  ))
                            ],
                          )),
                      Positioned(
                        bottom: -100,
                        child: Container(
                          // width: double.infinity,
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 150,
                          decoration: BoxDecoration(
                              color: AppColors.neu50,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                UserType(type: userData?.type ?? ""),
                                Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    spacing: 5,
                                    children: [
                                      const Icon(
                                        Icons.mail_outline_rounded,
                                        color: AppColors.neu900,
                                        size: 20,
                                      ),
                                      Text(userData?.email ?? "-",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge),
                                    ]),
                                Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    spacing: 5,
                                    children: [
                                      const Icon(
                                        Icons.phone_outlined,
                                        color: AppColors.neu900,
                                        size: 20,
                                      ),
                                      Text(userData?.phone ?? "-",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge),
                                    ]),
                                Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    spacing: 5,
                                    children: [
                                      const Icon(
                                        Icons.person_outline_rounded,
                                        color: AppColors.neu900,
                                        size: 20,
                                      ),
                                      Text(userData?.social ?? "-",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge),
                                    ]),
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
              const SizedBox(height: 120),
              const ProfileItem(
                  text: "Description",
                  icon: Icons.description_outlined,
                  path: "/my-description"),
              const SizedBox(
                height: 15,
              ),
              const ProfileItem(
                  text: "Location",
                  icon: Icons.location_on_outlined,
                  path: "/my-location"),
              const SizedBox(
                height: 15,
              ),
              const ProfileItem(
                  text: "History",
                  icon: Icons.history_rounded,
                  path: "/my-history"),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}
