import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sarnfan/models/user.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/white_surface.dart';

class OtherDescriptionPage extends StatefulWidget {
  final String username;
  const OtherDescriptionPage({super.key, required this.username});

  @override
  State<OtherDescriptionPage> createState() => _OtherDescriptionPageState();
}

class _OtherDescriptionPageState extends State<OtherDescriptionPage> {
  User? userData;
  bool _isLoading = true;
  Future<void> getOtherUser() async {
    try {
      var response = await ApiService.post("/other/user", {
        "username": widget.username,
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data.isNotEmpty) {
          setState(() {
            userData = User.fromJson(data);
            _isLoading = false;
          });
        }
        return;
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
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.neu50,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.pri500,
      ),
      backgroundColor: AppColors.pri500,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            WhiteSurface(
              minHeight: MediaQuery.of(context).size.height - 80,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 30, bottom: 10, left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Description",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: AppColors.pri500)),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Text(userData?.description ?? "No description yet",
                        style: Theme.of(context).textTheme.bodyMedium),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
