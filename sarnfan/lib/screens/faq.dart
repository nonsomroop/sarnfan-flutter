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
        title: const Text("FAQ"),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: const BottomNav(path: "/faq"),
      body: Column(children: [
        const Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FAQItem(path: "faq/what-is-sarnfan", text: "What is SarnFan?"),
              FAQItem(path: "faq/how-to-use", text: "How to use?"),
              FAQItem(path: "faq/how-to-verify", text: "How to get verified?"),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            decoration: BoxDecoration(
              // color: Colors.grey[200]

              color: AppColors.neu300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Contact Us",
                textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: AppColors.neu900,
                        )),
                const Text("IGGDGAfa")
              ],
            ),
          ),
        )
      ]),
    );
  }
}
