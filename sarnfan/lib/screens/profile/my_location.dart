import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarnfan/models/location.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/circular_loader.dart';
import 'package:sarnfan/widgets/white_surface.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MyLocationPage extends StatefulWidget {
  const MyLocationPage({super.key});

  @override
  State<MyLocationPage> createState() => _MyLocationPageState();
}

class _MyLocationPageState extends State<MyLocationPage> {
  late Marker marker;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getMyLocation();
  }

  Future<void> getMyLocation() async {
    try {
      var res = await ApiService.get("/my-location");
      const data = LatLng(13.67756931553056, 100.49165230566314);
      setState(() {
        marker = markPin(data);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Marker markPin(LatLng point) => Marker(
      point: point,
      width: 60,
      height: 60,
      child: Icon(Icons.location_on_rounded));

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
                          Text("Location",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: AppColors.pri500)),
                          IconButton(
                              onPressed: () {
                                context.go("/edit-location");
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: AppColors.pri500,
                              ))
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
                              initialCenter: marker.point ?? LatLng(0, 0),
                              initialZoom: 15,
                            ),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                userAgentPackageName: 'com.example.app',
                              ),
                              MarkerLayer(markers: [marker])
                            ],
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
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
