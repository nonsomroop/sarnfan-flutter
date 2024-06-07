import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sarnfan/providers/app_provider.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:sarnfan/widgets/bottom_nav.dart';
import 'package:sarnfan/widgets/wrapper.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
    _initProvider();
  }

  Future<void> _initProvider() async {
    await Provider.of<AppProvider>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      bottomNavigationBar: const BottomNav(path: "/help"),
      body: Column(
        children: [
          const Text("Who am I"),
          Text(appProvider.username ?? ""),
          ElevatedButton(
              onPressed: () =>
                  {ApiService.deleteToken(), context.go("/signin")},
              child: const Text("Logout"))
        ],
      ),
    );
  }
}
