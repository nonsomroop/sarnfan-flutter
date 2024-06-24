import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/cancel_box.dart';

class CreatePostItem extends StatefulWidget {
  final String text;
  final IconData icon;
  final Color color;
  final File? photo;
  final Uint8List? webPhoto;
  final Future<void> Function() pickImage;
  final void Function(File? newPhoto, Uint8List? newWebPhoto) onImageUpdated;

  const CreatePostItem({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.pickImage,
    required this.onImageUpdated,
    this.photo,
    this.webPhoto,
  });

  @override
  State<CreatePostItem> createState() => _CreatePostItemState();
}

class _CreatePostItemState extends State<CreatePostItem> {
  File? _currentPhoto;
  Uint8List? _currentWebPhoto;
  String test = "TEST";

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (kIsWeb) {
        _currentWebPhoto = await pickedFile.readAsBytes();
        _currentPhoto = null;
      } else {
        _currentPhoto = File(pickedFile.path);
        _currentWebPhoto = null;
      }
      setState(() {});
    }
  }

  void _removeImage() {
    setState(() {
      _currentPhoto = null;
      _currentWebPhoto = null;
    });
    widget.onImageUpdated(null, null);
    setState(() {});
  }

  @override
  void initState() {
    _currentPhoto = widget.photo;
    _currentWebPhoto = widget.webPhoto;
    super.initState();
  }

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
              return StatefulBuilder(builder: (context, setState) {
                return AlertDialog(
                    title: const Text("Upload photo"),
                    backgroundColor: AppColors.neu100,
                    contentPadding: const EdgeInsets.all(20),
                    content: _currentPhoto != null
                        ? Stack(children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.file(_currentPhoto!,
                                    fit: BoxFit.cover)),
                            CancelBox(function: () {
                              _removeImage();
                              setState(() {});
                            })
                          ])
                        : _currentWebPhoto != null
                            ? Stack(children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.memory(_currentWebPhoto!,
                                        fit: BoxFit.cover)),
                                CancelBox(function: () {
                                  _removeImage();
                                  setState(() {});
                                })
                              ])
                            : GestureDetector(
                                onTap: () async {
                                  await _pickImage();
                                  widget.onImageUpdated(
                                      _currentPhoto, _currentWebPhoto);
                                  setState(() {});
                                },
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: AppColors.neu200,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.upload_file,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ));
              });
            },
          );
        },
        icon: Icon(
          widget.icon,
          color: widget.color,
        ),
        label: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: widget.color),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: widget.color,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
