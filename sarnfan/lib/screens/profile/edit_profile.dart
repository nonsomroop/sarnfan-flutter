import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/green_surface.dart';
import 'package:sarnfan/widgets/text_input.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
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
            titleSpacing: 10,
            title: Text(
              "Edit Profile",
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.neu50),
            ),
            backgroundColor: AppColors.pri500),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    GreenSurface(
                        minHeight: 390,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 60,
                            ),
                            const SizedBox(
                              height: 120,
                              width: 120,
                              child: Image(
                                image: AssetImage("assets/images/profile.png"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: const CustomTextInput(
                                title: "Display Name",
                                placeholder: "placeholder",
                                titleColor: AppColors.neu50,
                              ),
                            )
                          ],
                        )),
                    Positioned(
                      bottom: -110,
                      child: Container(
                        // width: double.infinity,
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 220,
                        decoration: BoxDecoration(
                            color: AppColors.neu50,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "johndl.com",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: AppColors.neu700),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Phone Number",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: AppColors.neu500),
                                    ),
                                    TextFormField(
                                        // decoration:
                                        // InputDecoration(label: "Display Name"),
                                        )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Social Media",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: AppColors.neu500),
                                    ),
                                    TextFormField(
                                        // decoration:
                                        // InputDecoration(label: "Display Name"),
                                        )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
              const SizedBox(height: 170),
             
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.7,
                child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      "Cancel",
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(AppColors.pri500)),
                    child: const Text(
                      "Save",
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
