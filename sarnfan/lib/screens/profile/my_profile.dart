import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sarnfan/providers/app_provider.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/bottom_nav.dart';
import 'package:sarnfan/widgets/green_surface.dart';
import 'package:sarnfan/widgets/profile_item.dart';
import 'package:sarnfan/widgets/signout_modal.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
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
                  context.push("/edit-profile");
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
                            const SizedBox(
                              height: 120,
                              width: 120,
                              child: Image(
                                image: AssetImage("assets/images/profile.png"),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  appProvider.username ?? "",
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
                              Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 5,
                                  children: [
                                    Icon(
                                      appProvider.type == "ind"
                                          ? Icons.person_2_rounded
                                          : appProvider.type == "org"
                                              ? Icons.groups_2_rounded
                                              : appProvider.type == "school"
                                                  ? Icons.school_rounded
                                                  : Icons.question_mark_rounded,
                                      color: AppColors.pri600,
                                      size: 20,
                                    ),
                                    Text(appProvider.type == "ind"
                                          ? "Individual"
                                          : appProvider.type == "org"
                                              ? "Organization"
                                              : appProvider.type == "school"
                                                  ? "School"
                                                  : "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge?.copyWith(color:AppColors.pri600)),
                                  ]),
                              Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 5,
                                  children: [
                                    const Icon(
                                      Icons.mail_outline_rounded,
                                      color: AppColors.neu900,
                                      size: 20,
                                    ),
                                    Text(appProvider.email ?? "",
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
                                    Text(appProvider.phone ?? "-",
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
                                    Text(appProvider.social ?? "-",
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
