import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sarnfan/services/api_service.dart';

class AppProvider extends ChangeNotifier {
  String? _username;
  String? _email;
  String? _type;
  String? _phone;
  String? _social;
  String? _location;
  bool _isLoggedIn = false;

  String? get username => _username;
  String? get email => _email;
  String? get type => _type;
  String? get phone => _phone;
  String? get social => _social;
  String? get location => _location;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> init() async {
    _isLoggedIn = await ApiService.checkToken();
    if (_isLoggedIn) {
      try {
        Response response = await ApiService.get("/verify/getuser");

        if (response.statusCode == 200) {
          Map<String, dynamic> userData = jsonDecode(response.body);
          _username = userData["username"];
          _email = userData["email"];
          _type = userData["type"];
          _phone = userData["phone"];
          _social = userData["social"];
          _location = userData["location"];
          notifyListeners();
        } else {
          print("Failed to fetch user data: ${response.statusCode}");
        }
      } catch (e) {
        print("Error fetching user data: $e");
      }
    }
  }
}
