import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sarnfan/providers/app_provider.dart';
import 'package:sarnfan/services/api_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _sendData() async {
    try {
      final data = {
        "email": _emailController.text,
        "password": _passwordController.text
      };
      final response = await ApiService.post("/signin", data);
      if (response.statusCode == 200) {
        print('Data sent successfully!');
        final dynamic responseData =
            jsonDecode(response.body); // Parse response body
        final String? token = responseData['token'];
        ApiService.setToken(token ?? "");
        if (!mounted) return;
        Provider.of<AppProvider>(context, listen: false).init();
        context.go("/test");
      } else {
        print('Status data: ${response.statusCode}');
        if (response.statusCode != 201) {
          print(response.body);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DEMO SIGN IN")),
      body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("Send data");
                        _sendData();
                      }
                    },
                    child: const Text('Sign In'),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go("/signup");
                    },
                    child: const Text(
                      "Sign up Page",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
