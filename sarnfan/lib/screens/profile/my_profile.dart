import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sarnfan/providers/app_provider.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/bottom_nav.dart';
import 'package:sarnfan/widgets/green_surface.dart';
import 'package:sarnfan/widgets/profile_item.dart';
import 'package:sarnfan/widgets/signout_modal.dart';
import 'package:sarnfan/widgets/user_type.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  static final backendUrl =
      dotenv.env["BACKEND_URL"] ?? "http://localhost:4000";

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
        appBar: AppBar(backgroundColor: AppColors.pri500, actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.neu50,
                  borderRadius: BorderRadius.circular(100)),
              child: IconButton(
                icon: const Icon(
                  Icons.edit_outlined,
                  color: AppColors.pri500,
                ),
                onPressed: () {
                  context.go("/edit-profile");
                },
              ),
            ),
          )
        ]),
        bottomNavigationBar: const BottomNav(path: "/my-profile"),
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
                            Skeletonizer(
                                enabled: appProvider.isLoading,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  height: 120,
                                  width: 120,
                                  child: ClipOval(
                                    child: Image.network(
                                      appProvider.picture != null
                                          ? "$backendUrl/pic/profiles/${appProvider.picture}"
                                          : "assets/images/profile.png",
                                      fit: BoxFit
                                          .cover, // Ensures the image covers the entire circle
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          "assets/images/profile.png",
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                )),
                            Skeletonizer(
                                enabled: appProvider.isLoading,
                                child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      appProvider.username ?? "username",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(color: AppColors.neu50),
                                    )))
                          ],
                        )),
                    Positioned(
                        bottom: -100,
                        child: Skeletonizer(
                          enabled: appProvider.isLoading,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 150,
                            decoration: BoxDecoration(
                                color: AppColors.neu50,
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  UserType(type: appProvider.type ?? "ind"),
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
                                        Text(appProvider.email ?? "user@gmail.com",
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
                                        Text(appProvider.phone ?? "0000000000",
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
                                        Text(appProvider.social ?? "0000000000",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge),
                                      ]),
                                ],
                              ),
                            ),
                          ),
                        ))
                  ]),
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
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SignoutModal();
                          });
                      // await Provider.of<AppProvider>(context, listen: false)
                      //     .logout();
                      // if (context.mounted) {
                      //   context.go("/");
                      // }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(AppColors.red500)),
                    child: Text(
                      "Sign out",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppColors.neu50),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ));
  }
}
