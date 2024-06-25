import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:sarnfan/models/user.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/circular_loader.dart';
import 'package:sarnfan/widgets/white_surface.dart';

class OtherLocationPage extends StatefulWidget {
  final String username;
  const OtherLocationPage({super.key, required this.username});

  @override
  State<OtherLocationPage> createState() => _OtherLocationPageState();
}

class _OtherLocationPageState extends State<OtherLocationPage> {
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

  Marker markPin(LatLng point) => Marker(
      point: point,
      width: 60,
      height: 60,
      child: const Icon(
        Icons.location_on_rounded,
        color: AppColors.red500,
      ));

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
            context.pop(context);
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
                          Text("Location",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: AppColors.pri500)),
                        ],
                      )),
                  // Padding(

                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: AppColors.neu200),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: _isLoading
                        ? const CircularLoader()
                        : FlutterMap(
                            options: MapOptions(
                              initialCenter: markPin(LatLng(
                                      userData?.latitude ?? 0.0,
                                      userData?.longitude ?? 0.0))
                                  .point,
                              initialZoom: 15,
                            ),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                userAgentPackageName: 'com.example.app',
                              ),
                              MarkerLayer(markers: [
                                markPin(LatLng(userData?.latitude ?? 0.0,
                                    userData?.longitude ?? 0.0))
                              ])
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
