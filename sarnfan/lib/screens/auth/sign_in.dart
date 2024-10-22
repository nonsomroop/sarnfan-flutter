import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sarnfan/providers/app_provider.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/wrapper.dart';

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

  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _sendData() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });
      final data = {
        "email": _emailController.text,
        "password": _passwordController.text
      };
      final response = await ApiService.post("/auth/signin", data);
      await Future.delayed(
          const Duration(seconds: 1)); // Simulate a network delay
      if (response.statusCode == 200) {
        print('Data sent successfully!');
        final dynamic responseData =
            jsonDecode(response.body); // Parse response body
        final String? token = responseData['token'];
        ApiService.setToken(token ?? "");
        if (!mounted) return;
        Provider.of<AppProvider>(context, listen: false).init();
        context.go("/");
      } else if (response.statusCode == 400) {
        final dynamic responseData = jsonDecode(response.body);
        setState(() {
          _errorMessage = responseData['message'] ?? 'Invalid credentials';
        });
      } else {
        print('Status data: ${response.statusCode}');
        if (response.statusCode != 201) {
          print(response.body);
        }
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrapper(
          child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("SarnFan",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: AppColors.pri600)),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 50),
                    child: Image(
                        image: AssetImage('assets/images/logo_gradient.png'),
                        width: 120,
                        height: 120),
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                                labelText: 'Email',
                                hintText: "e.g. johndoe@gmal.com"),
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
                            decoration: const InputDecoration(
                                labelText: 'Password', hintText: "**********"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            obscureText: true,
                          ),
                          if (_errorMessage != null) ...[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                _errorMessage!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: AppColors.red500,
                                    ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                          const SizedBox(height: 100),
                          ElevatedButton(
                            onPressed: _isLoading
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      print("Send data");
                                      _sendData();
                                    }
                                  },
                            style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                    AppColors.pri500),
                                minimumSize: WidgetStateProperty.all<Size>(
                                    const Size(double.infinity, 50))),
                            child: _isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          AppColors.neu50),
                                    ),
                                  )
                                : const Text('Sign in'),
                          ),
                          const SizedBox(height: 15),
                          TextButton(
                              onPressed: _isLoading
                                  ? null
                                  : () {
                                      context.go("/signup");
                                    },
                              child: const Text(
                                "Don't have an account? Sign up",
                                style: TextStyle(color: AppColors.neu600),
                              ))
                        ],
                      )),
                ],
              ))),
    );
  }
}
