import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/bottom_nav.dart';
import 'package:sarnfan/widgets/faq_item.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text("FAQ"),
        ),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: const BottomNav(path: "/faq"),
      body: SingleChildScrollView(
        child: Column(children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FAQItem(path: "faq/what-is-sarnfan", text: "What is SarnFan?"),
              FAQItem(path: "faq/how-to-use", text: "How to use?"),
              FAQItem(path: "faq/how-to-verify", text: "How to get verified?"),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                color: AppColors.neu50,
                borderRadius: BorderRadius.circular(30)),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Contact us"),Text("askfksapjfkasjfkalsfjsaljf")],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
