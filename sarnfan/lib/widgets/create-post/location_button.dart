import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:http/http.dart' as http;

class LocationButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final Color color;
  final MapController mapController;
  final LatLng selectedLocation;
  final ValueChanged<LatLng> onLocationChange;

  const LocationButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.color,
      required this.mapController,
      required this.selectedLocation,
      required this.onLocationChange});

  @override
  State<LocationButton> createState() => _LocationButtonState();
}

class _LocationButtonState extends State<LocationButton> {
  Marker markPin(LatLng point) => Marker(
      point: point,
      width: 60,
      height: 60,
      child: const Icon(Icons.location_on_rounded, color: AppColors.red500));

  @override
  Widget build(BuildContext context) {
    Marker marker = markPin(widget.selectedLocation);
    return SizedBox(
        // width: MediaQuery.of(context).size.width * 0.7,
        height: 80,
        child: ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(AppColors.neu50),
              overlayColor: WidgetStateProperty.all<Color>(AppColors.neu200),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Select Location"),
                      content: Column(
                        children: [
                          SizedBox(
                              height: 300,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: FlutterMap(
                                mapController: widget.mapController,
                                options: MapOptions(
                                  initialCenter: widget.selectedLocation,
                                  initialZoom: 15,
                                  onTap: (pos, latlng) => setState(() {
                                    // widget.onLocationChange(latlng);
                                    marker = markPin(latlng);
                                    print(marker.point);
                                  }),
                                ),
                                children: [
                                  TileLayer(
                                    urlTemplate:
                                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                    userAgentPackageName: 'com.example.app',
                                  ),
                                  MarkerLayer(markers: [marker])
                                ],
                              )),
                        ],
                      ),
                    );
                  });
            },
            icon: Icon(
              widget.icon,
              color: widget.color,
            ),
            label: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.text,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: widget.color)),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: widget.color,
                  size: 20,
                )
              ],
            )));
  }
}
