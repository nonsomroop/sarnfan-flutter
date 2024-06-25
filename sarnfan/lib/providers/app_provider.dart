import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sarnfan/services/api_service.dart';

class AppProvider extends ChangeNotifier {
  String? _picture;
  String? _username;
  String? _email;
  String? _type;
  String? _phone;
  String? _social;
  String? _description;
  double? _latitude;
  double? _longitude;
  bool _isLoggedIn = false;
  bool _isLoading = true;

  String? get picture => _picture;
  String? get username => _username;
  String? get email => _email;
  String? get type => _type;
  String? get phone => _phone;
  String? get social => _social;
  String? get description => _description;
  double? get latitude => _latitude;
  double? get longitude => _longitude;
  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  Future<void> init() async {
    _isLoggedIn = await ApiService.checkToken();
    if (_isLoggedIn) {
      try {
        Response response = await ApiService.get("/user/getuser");

        if (response.statusCode == 200) {
          Map<String, dynamic> userData = jsonDecode(response.body);
          _picture = userData["picture"];
          _username = userData["username"];
          _email = userData["email"];
          _type = userData["type"];
          _phone = userData["phone"];
          _social = userData["social"];
          _description = userData["description"];
          _latitude = userData["latitude"];
          _longitude = userData["longitude"];
          _picture = userData["picture"];
          _isLoading = false;
          notifyListeners();
        } else {
          print("Failed to fetch user data: ${response.statusCode}");
        }
      } catch (e) {
        print("Error fetching user data: $e");
      }
    } else {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _username = null;
    _email = null;
    _type = null;
    _phone = null;
    _social = null;
    _latitude = null;
    _longitude = null;
    _isLoggedIn = false;
    _description = null;

    await ApiService.deleteToken();
    notifyListeners();
  }
}
