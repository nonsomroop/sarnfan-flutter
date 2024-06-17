import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sarnfan/providers/app_provider.dart';
import 'package:sarnfan/themes/color_theme.dart';

class SignoutModal extends StatelessWidget {
  const SignoutModal({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.neu100,
      actionsAlignment: MainAxisAlignment.spaceBetween,
      title: const Text("Sign out"),
      content: const Text("Are you sure you want to sign out?"),
      actions: [
        Container(
          width: 130,
          child: ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all<Color>(AppColors.neu300),
              ),
              child: const Text("Cancel",
                  style: TextStyle(color: AppColors.neu900))),
        ),
        Container(
          width: 130,
          child: ElevatedButton(
              onPressed: () async {
                await Provider.of<AppProvider>(context, listen: false).logout();
                if (context.mounted) {
                  context.go("/");
                }
              },
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(AppColors.red500)),
              child: const Text(
                "Sign out",
              )),
        ),
      ],
    );
  }
}
