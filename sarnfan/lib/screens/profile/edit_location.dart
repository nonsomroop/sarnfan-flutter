import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/circular_loader.dart';
import 'package:sarnfan/widgets/white_surface.dart';
import 'package:http/http.dart' as http;

class EditLocationPage extends StatefulWidget {
  const EditLocationPage({super.key});

  @override
  State<EditLocationPage> createState() => _EditLocationPageState();
}

class _EditLocationPageState extends State<EditLocationPage> {
  late Marker marker;
  Marker? newMarker;
  bool _isLoading = true;
  final TextEditingController _searchController = TextEditingController();
  final MapController _mapController = MapController();
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
        marker = const Marker(
            point: data,
            child: Icon(Icons.location_on_rounded, color: AppColors.neu700));
        _isLoading = false;
      });
    } catch (e) {}
  }

  Future<void> saveMyLocation() async {
    if (newMarker == null) {
      return;
    }
    try {
      print(newMarker!.point.latitude);
      print(newMarker!.point.longitude);
    } catch (e) {}
  }

  Marker markPin(LatLng point) => Marker(
      point: point,
      width: 60,
      height: 60,
      child: const Icon(Icons.location_on_rounded, color: AppColors.red500));

  Future<LatLng?> searchLocation(String query) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=1');
    final response = await http.get(url);
    print("location  " + response.body);

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
        title: Text("Edit Location",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.neu50)),
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
                  Padding(
                    padding: const EdgeInsets.only(top:10.0, bottom:20),
                    child: Container(
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
                                    final query = _searchController.text;
                                    if (query.isNotEmpty) {
                                      final location = await searchLocation(query);
                                      if (location != null) {
                                        setState(() {
                                          newMarker = markPin(location);
                                          _mapController.move(location,10);
                                        });
                                      }
                                    }
                                  }),
                            )),
                      ),
                    ),
                  ),
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
                              initialCenter: marker.point,
                              initialZoom: 15,
                              onTap: (pos, latlng) => setState(() {
                                newMarker = markPin(latlng);
                              }),
                            ),
                            mapController: _mapController,
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                userAgentPackageName: 'com.example.app',
                              ),
                              MarkerLayer(markers: [
                                marker,
                                if (newMarker != null) newMarker!
                              ])
                            ],
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 30),
                    child: Column(
                      children: [
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
                              onPressed: () {
                                saveMyLocation();
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                          AppColors.pri500)),
                              child: const Text(
                                "Save",
                              )),
                        ),
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
