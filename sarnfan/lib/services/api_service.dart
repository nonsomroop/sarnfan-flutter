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
}
