import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static final backendUrl =
      dotenv.env["BACKEND_URL"] ?? "http://localhost:4000";
  static const _storage = FlutterSecureStorage();

  static Future<String?> _getToken() async {
    return await _storage.read(key: 'auth_token');
  }

  static Future<bool> checkToken() async {
    final token = await _getToken();
    return token != null && token.isNotEmpty;
  }

  static Future<void> setToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  static Future<void> deleteToken() async {
    await _storage.delete(key: 'auth_token');
  }

  static Future<http.Response> get(String path) async {
    final token = await _getToken();
    final response = await http.get(
      Uri.parse("$backendUrl$path"),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      },
    );
    return response;
  }

  static Future<http.Response> post(
      String path, Map<String, dynamic> data) async {
    final token = await _getToken();
    final response = await http.post(
      Uri.parse("$backendUrl$path"),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(data),
    );
    return response;
  }

  static Future<http.Response> patch(
      String path, Map<String, dynamic> data) async {
    final token = await _getToken();
    final response = await http.patch(
      Uri.parse("$backendUrl$path"),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(data),
    );
    return response;
  }

  static Future<http.Response> delete(String path) async {
    final token = await _getToken();
    final response = await http.get(
      Uri.parse("$backendUrl$path"),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      },
    );
    return response;
  }

  static String serverImage(String path) {
    return "$backendUrl/pic/$path";
  }

  static Future<void> uploadImageProfilePic(
      String path, Uint8List imageBytes) async {
    final token = await _getToken();
    var request = http.MultipartRequest('PATCH', Uri.parse("$backendUrl$path"));

    request.headers.addAll({
      'Authorization': 'Bearer $token',
    });

    var stream = http.ByteStream.fromBytes(imageBytes);
    var length = imageBytes.length;

    request.files.add(http.MultipartFile(
      'profilePic',
      stream,
      length,
      filename: 'profile_pic.png',
    ));

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      } else {
        print('Failed to upload image: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
}
