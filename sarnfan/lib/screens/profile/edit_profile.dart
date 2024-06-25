import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sarnfan/providers/app_provider.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/green_surface.dart';
import 'package:sarnfan/widgets/text_input.dart';
import 'package:sarnfan/widgets/upload_avatar.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late TextEditingController _usernameController;
  late TextEditingController _phoneController;
  late TextEditingController _socialController;

  @override
  void initState() {
    super.initState();
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    _usernameController = TextEditingController(text: appProvider.username);
    _phoneController = TextEditingController(text: appProvider.phone);
    _socialController = TextEditingController(text: appProvider.social);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneController.dispose();
    _socialController.dispose();
    super.dispose();
  }

  void _showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => context.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> _updateData() async {
    try {
      final data = {
        "username": _usernameController.text,
        "phone": _phoneController.text,
        "social": _socialController.text
      };
      final response = await ApiService.patch("/user/update", data);
      if (response.statusCode == 200) {
        print('Data sent successfully!');
        final dynamic responseData = jsonDecode(response.body);
        final String? message = responseData;
        print(message);
        if (!mounted) return;
        Provider.of<AppProvider>(context, listen: false).init();
        context.go("/my-profile");
      } else if (response.statusCode == 400) {
        final dynamic responseData = jsonDecode(response.body);
        final String? message = responseData;
        print(message);
        if (message == "Username is already taken") {
          _showErrorMessage("Username is already taken");
        }
      } else {
        print('Status data: ${response.statusCode}');
        if (response.statusCode != 201) {
          print(response.body);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  context.go("/my-profile");
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
          child: Form(
              key: _formKey,
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
                                UploadAvatar(
                                    pictureUrl: appProvider.picture ?? ""),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: CustomTextInput(
                                    controller: _usernameController,
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
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 220,
                            decoration: BoxDecoration(
                                color: AppColors.neu50,
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    appProvider.email ?? "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(color: AppColors.neu700),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Phone Number",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  color: AppColors.neu500),
                                        ),
                                        TextFormField(
                                          controller: _phoneController,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Social Media",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  color: AppColors.neu500),
                                        ),
                                        TextFormField(
                                          controller: _socialController,
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
                        onPressed: () {
                          context.go("/my-profile");
                        },
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
                        onPressed: () {
                          _updateData();
                        },
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                                AppColors.pri500)),
                        child: const Text(
                          "Save",
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              )),
        ));
  }
}

