import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarnfan/providers/app_provider.dart';
import 'package:sarnfan/services/api_service.dart';
import 'package:sarnfan/themes/color_theme.dart';

class ReportPost extends StatefulWidget {
  final num post;

  const ReportPost({super.key, required this.post});

  @override
  State<ReportPost> createState() => _ReportPostState();
}

class _ReportPostState extends State<ReportPost> {
  final TextEditingController _reportController = TextEditingController();
  @override
  void dispose() {
    _reportController.dispose();
    super.dispose();
  }

  Future<void> _submitReportData() async {
    try {
      final data = {"report": _reportController.text, "post_id": widget.post};
      final response = await ApiService.post("/user/report", data);
      if (response.statusCode == 200) {
        print('Report sent successfully!');
        final dynamic responseData = jsonDecode(response.body);
        final String? message = responseData;
        print(message);
        if (!mounted) return;
        Provider.of<AppProvider>(context, listen: false).init();
      } else {
        print('Status data: ${response.statusCode}');
        if (response.statusCode != 200) {
          print(response.body);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.neu100,
      actionsAlignment: MainAxisAlignment.spaceBetween,
      title: const Text('Report Post'),
      content: Wrap(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
                'Please explain why you feel this post is inappropriate or breaks the guideline.'),
          ),
          TextFormField(
            maxLines: 5,
            controller: _reportController,
            decoration: const InputDecoration(
              hintText: 'Write your report here',
              border: OutlineInputBorder(),
            ),
          )
        ],
      ),
      actions: [
        Container(
          width: 115,
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
          width: 115,
          child: ElevatedButton(
              onPressed: () async {
                _submitReportData();
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(AppColors.red500)),
              child: const Text(
                "Report",
              )),
        ),
      ],
    );
  }
}
