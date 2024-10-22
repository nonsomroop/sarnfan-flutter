import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:sarnfan/providers/app_provider.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/create-post/create_post_item.dart';
import 'package:sarnfan/widgets/create-post/location_button.dart';
import 'package:sarnfan/widgets/create-post/select_tag_item.dart';
import 'package:sarnfan/widgets/text_input.dart';
import 'package:sarnfan/widgets/white_surface.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _postTitleController = TextEditingController();
  final TextEditingController _postDescriptionController =
      TextEditingController();
  final MapController mapController = MapController();
  File? _photo;
  Uint8List? _webPhoto;

  var regionValue = 'All';
  var regions = [
    'All',
    'Central',
    'Northern',
    'Northeastern',
    'Eastern',
    'Western',
    'Southern'
  ];
  var activityValue = 'All';
  var activities = [
    'All',
    'Volunteer',
    'Donation',
    'Workshop',
    'Other',
  ];

  DateTime selectedDate = DateTime.now();
  bool _isLoading = false;

  Future<void> _createPost() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });
      try {
        final data = {
          "title": _postTitleController.text,
          "content": _postDescriptionController.text,
          "region": regionValue,
          "activity": activityValue,
          "end_date": selectedDate.toString().substring(0, 10),
          "latitude": location.latitude,
          "longitude": location.longitude,
          "address": ""
        };
        Response response;
        if (_photo != null || _webPhoto != null) {
          print("Condition here");
          Map<String, String> stringData = {
            "title": data["title"].toString(),
            "content": data["content"].toString(),
            "region": data["region"].toString(),
            "activity": data["activity"].toString(),
            "end_date": data["end_date"].toString(),
            "latitude": data["latitude"].toString(),
            "longitude": data["longitude"].toString(),
            "address": data["address"].toString()
          };
          response = await ApiService.uploadImagePost(
              "/upload/post-image", _webPhoto!, stringData);
        } else {
          response = await ApiService.post("/user/createpost", data);
        }
        if (response.statusCode == 201 || response.statusCode == 200) {
          print('Data sent successfully!');
          print(response.body);
          if (!mounted) return;
          context.go("/home");
          if (response.statusCode != 201 || response.statusCode != 200) {
            print(response.body);
          }
          print(data);
        }
      } catch (e) {
        print(e);
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 180)),
        initialDate: selectedDate,
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
                colorScheme: const ColorScheme.light(primary: AppColors.pri500),
                buttonTheme:
                    const ButtonThemeData(textTheme: ButtonTextTheme.primary)),
            child: child!,
          );
        });
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  late LatLng location;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (kIsWeb) {
        _webPhoto = await pickedFile.readAsBytes();
      } else {
        _photo = File(pickedFile.path);
      }
      setState(() {});
    }
  }

  void _updateImage(File? newPhoto, Uint8List? newWebPhoto) {
    setState(() {
      _photo = newPhoto;
      _webPhoto = newWebPhoto;
    });
  }

  @override
  void initState() {
    super.initState();
    location = const LatLng(0, 0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final appProvider = context.read<AppProvider>();
    location =
        LatLng(appProvider.latitude ?? 0.0, appProvider.longitude ?? 0.0);
  }

  void updateLocation(LatLng newLocation) {
    setState(() {
      location = newLocation;
      print("Location updated in CreatePostPage:");
      print(location);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pri500,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.go("/home");
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: AppColors.neu50,
              )),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : _createPost, // Disable button when loading
                    style: ButtonStyle(
                        fixedSize:
                            WidgetStateProperty.all<Size>(const Size(110, 35)),
                        backgroundColor: _isLoading
                            ? WidgetStateProperty.all<Color>(
                                const Color.fromARGB(255, 71, 120, 127))
                            : WidgetStateProperty.all<Color>(AppColors.pri700)),
                    child: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.neu50),
                            ),
                          )
                        : const Text("Post")))
          ],
          titleSpacing: 10,
          title: Text(
            "Create Post",
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.neu50),
          ),
          backgroundColor: AppColors.pri500),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            WhiteSurface(
              minHeight: MediaQuery.of(context).size.height - 100,
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child: CustomTextInput(
                            title: "Post Title",
                            placeholder: "e.g. requests, needs",
                            titleColor: AppColors.neu700,
                            controller: _postTitleController,
                            emptyValidator: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child: CustomTextInput(
                            title: "Description",
                            placeholder:
                                "e.g. details, amount of people, conditions",
                            titleColor: AppColors.neu700,
                            controller: _postDescriptionController,
                            emptyValidator: true,
                            maxLines: 5,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 10),
                            child: CreatePostItem(
                              text: "Add Photo",
                              icon: Icons.photo_rounded,
                              color: AppColors.pri600,
                              photo: _photo,
                              webPhoto: _webPhoto,
                              pickImage: _pickImage,
                              onImageUpdated: _updateImage,
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 10),
                            child: LocationButton(
                              text: "Add Location",
                              icon: Icons.location_on_outlined,
                              color: AppColors.sec600,
                              location: location,
                              onLocationChange: updateLocation,
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Select end date",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: AppColors.neu900),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .9,
                                  height: 50,
                                  child: GestureDetector(
                                    onTap: () {
                                      _selectDate(context);
                                    },
                                    child: TextFormField(
                                      enabled: false,
                                      controller: TextEditingController()
                                        ..text = selectedDate
                                            .toString()
                                            .substring(0, 10),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 10),
                            child: Text(
                              "Select Activity",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: AppColors.neu900),
                            )),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: activities.map((activity) {
                            return SelectTagItem(
                              text: activity,
                              isSelected: activityValue == activity,
                              onTap: () {
                                setState(() {
                                  activityValue = activity;
                                });
                              },
                            );
                          }).toList()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "Select Region",
                                    textAlign: TextAlign.start,
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                ),
                                DropdownMenu(
                                  width: MediaQuery.of(context).size.width * .9,
                                  onSelected: (region) => {
                                    if (region != null)
                                      {
                                        setState(() {
                                          regionValue = region;
                                        }),
                                      }
                                  },
                                  initialSelection: "All",
                                  dropdownMenuEntries: regions.map((option) {
                                    return DropdownMenuEntry(
                                        value: option, label: option);
                                  }).toList(),
                                ),
                              ]),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
