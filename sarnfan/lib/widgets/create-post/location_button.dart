import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:http/http.dart' as http;

class LocationButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final Color color;
  final LatLng location;
  final ValueChanged<LatLng> onLocationChange;

  const LocationButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.color,
      required this.location,
      required this.onLocationChange});

  @override
  State<LocationButton> createState() => _LocationButtonState();
}

class _LocationButtonState extends State<LocationButton> {
  late LatLng _location;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _location = widget.location;
  }

  @override
  void didUpdateWidget(LocationButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.location != widget.location) {
      setState(() {
        _location = widget.location;
      });
    }
  }

  Future<LatLng?> searchLocation(String query) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      if (data.isNotEmpty) {
        final location = data[0];
        return LatLng(
            double.parse(location['lat']), double.parse(location['lon']));
      }
    }
    return null;
  }

  Marker markPin(LatLng point) => Marker(
      point: point,
      width: 60,
      height: 60,
      child: const Icon(Icons.location_on_rounded, color: AppColors.red500));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    final MapController mapController = MapController();

                    return AlertDialog(
                      title: const Text("Select Location"),
                      backgroundColor: AppColors.neu100,
                      // color: AppColors.neu400,
                      // width: MediaQuery.of(context).size.width,
                      contentPadding: const EdgeInsets.only(
                          top: 20, bottom: 50, left: 20, right: 20),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 20),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: TextFormField(
                                maxLines: 1,
                                controller: _searchController,
                                scrollPadding: const EdgeInsets.all(20),
                                decoration: InputDecoration(
                                    hintText: "e.g. road, city, country",
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: IconButton(
                                          icon: const Icon(Icons.search),
                                          onPressed: () async {
                                            final query =
                                                _searchController.text;
                                            if (query.isNotEmpty) {
                                              final location =
                                                  await searchLocation(query);
                                              if (location != null) {
                                                setState(() {
                                                  _location = location;
                                                  widget.onLocationChange(
                                                      _location);
                                                  mapController.move(
                                                      _location, 15);
                                                });
                                              }
                                            }
                                          }),
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return FlutterMap(
                                  mapController: mapController,
                                  options: MapOptions(
                                    initialCenter: Marker(
                                            point: _location,
                                            width: 60,
                                            height: 60,
                                            child: const Icon(
                                                Icons.location_on_rounded,
                                                color: AppColors.red500))
                                        .point,
                                    initialZoom: 15,
                                    onTap: (pos, latlng) => setState(() {
                                      _location = latlng;
                                      widget.onLocationChange(latlng);
                                    }),
                                  ),
                                  // mapController: _mapController,
                                  children: [
                                    TileLayer(
                                      urlTemplate:
                                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                      userAgentPackageName: 'com.example.app',
                                    ),
                                    MarkerLayer(markers: [
                                      markPin(_location),
                                    ])
                                  ],
                                );
                              },
                            ),
                          )
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
