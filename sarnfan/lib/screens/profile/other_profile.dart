// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/bottom_nav.dart';
import 'package:sarnfan/widgets/green_surface.dart';
import 'package:sarnfan/widgets/profile_item.dart';
import 'package:sarnfan/widgets/wrapper.dart';

class OtherProfilePage extends StatefulWidget {
  const OtherProfilePage({super.key});

  @override
  State<OtherProfilePage> createState() => _OtherProfilePageState();
}

class _OtherProfilePageState extends State<OtherProfilePage> {
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
        bottomNavigationBar: BottomNav(path: "/my-profile"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    GreenSurface(
                        minHeight: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: Image(
                                image: AssetImage("assets/images/profile.png"),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "John Doe",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(color: AppColors.neu50),
                                ))
                          ],
                        )),
                    Positioned(
                      bottom: -75,
                      child: Container(
                        // width: double.infinity,
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 130,
                        decoration: BoxDecoration(
                            color: AppColors.neu50,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 5,
                                  children: [
                                    const Icon(
                                      Icons.mail_outline_rounded,
                                      color: AppColors.neu900,
                                      size: 20,
                                    ),
                                    Text("johndoe@gmail.com",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge),
                                  ]),
                              Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 5,
                                  children: [
                                    const Icon(
                                      Icons.phone_outlined,
                                      color: AppColors.neu900,
                                      size: 20,
                                    ),
                                    Text("098232324",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge),
                                  ]),
                              Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 5,
                                  children: [
                                    const Icon(
                                      Icons.person_outline_rounded,
                                      color: AppColors.neu900,
                                      size: 20,
                                    ),
                                    Text("joghndoe23",
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
              SizedBox(height: 90),
              ProfileItem(
                  text: "Description",
                  icon: Icons.description_outlined,
                  path: "/my-description"),
              SizedBox(
                height: 15,
              ),
              ProfileItem(
                  text: "Location",
                  icon: Icons.location_on_outlined,
                  path: "/my-location"),
              SizedBox(
                height: 15,
              ),
              ProfileItem(
                  text: "History",
                  icon: Icons.history_rounded,
                  path: "/my-history"),
              SizedBox(
                height: 30,
              ),
            
            ],
          ),
        ));
  }
}