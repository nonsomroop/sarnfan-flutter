import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class UploadAvatar extends StatefulWidget {
  final String? pictureUrl;
  const UploadAvatar({super.key, required this.pictureUrl});

  @override
  State<UploadAvatar> createState() => _UploadAvatarState();
}

class _UploadAvatarState extends State<UploadAvatar> {
  File? _image;
  Uint8List? _webImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (kIsWeb) {
        _webImage = await pickedFile.readAsBytes();
      } else {
        _image = File(pickedFile.path);
      }
      setState(() {});
      await _uploadImage();
    }
  }

  Future<void> _uploadImage() async {
    try {
      if (kIsWeb) {
        print('Uploading web image');
        var response = await ApiService.uploadImageProfilePic(
            "/upload/profile-pic", _webImage!);
      } else {
        print('Uploading mobile image: ${_image!.path}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: SizedBox(
        height: 120,
        width: 120,
        child: Stack(
          children: [
            CircleAvatar(
              backgroundImage: _image != null
                  ? FileImage(_image!)
                  : _webImage != null
                      ? MemoryImage(_webImage!)
                      : (widget.pictureUrl != null &&
                              widget.pictureUrl!.isNotEmpty
                          ? NetworkImage(ApiService.serverImage(
                              "profiles/${widget.pictureUrl}"))
                          : const AssetImage("assets/images/profile.png")),
              radius: 60,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
            const Center(
              child: Icon(
                Icons.upload,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
