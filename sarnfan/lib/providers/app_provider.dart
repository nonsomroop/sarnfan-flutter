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
  // String? _location;
  String? _description;
  double? _latitude;
  double? _longitude;
  bool _isLoggedIn = false;

  String? get username => _username;
  String? get email => _email;
  String? get type => _type;
  String? get phone => _phone;
  String? get social => _social;
  String? get description => _description;
  // String? get location => _location;
  double? get latitude => _latitude;
  double? get longitude => _longitude;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> init() async {
    _isLoggedIn = await ApiService.checkToken();
    if (_isLoggedIn) {
      try {
        Response response = await ApiService.get("/user/getuser");

        if (response.statusCode == 200) {
          Map<String, dynamic> userData = jsonDecode(response.body);
          _username = userData["username"];
          _email = userData["email"];
          _type = userData["type"];
          _phone = userData["phone"];
          _social = userData["social"];
      
          // _location = userData["location"];
          _latitude = userData["latitude"];
          _longitude = userData["longitude"];
          _description = userData["description"];
          notifyListeners();
        } else {
          print("Failed to fetch user data: ${response.statusCode}");
        }
      } catch (e) {
        print("Error fetching user data: $e");
      }
    }
  }

  Future<void> logout() async {
    _username = null;
    _email = null;
    _type = null;
    _phone = null;
    _social = null;
    // _location = null;
    _latitude = null;
    _longitude = null;
    _isLoggedIn = false;
    _description = null;

    await ApiService.deleteToken();
    notifyListeners();
  }
}
