import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:sarnfan/services/api_service.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late String username = "";

  @override
  void initState() {
    _fetchUsername();
    super.initState();
  }

  Future<void> _fetchUsername() async {
    try {
      Response response = await ApiService.get("/verify/getuser");
      setState(() {
        username = response.body;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Who am I"),
          Text(username),
          ElevatedButton(
              onPressed: () =>
                  {ApiService.deleteToken(), context.go("/signup")},
              child: const Text("Logout"))
        ],
      ),
    );
  }
}
