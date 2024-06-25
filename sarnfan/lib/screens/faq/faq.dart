import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
              FAQItem(path: "/what-is-sarnfan", text: "What is SarnFan?"),
              FAQItem(path: "/how-to-use", text: "How to use?"),
              FAQItem(path: "/how-to-get-verified", text: "How to get verified?"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                color: AppColors.neu50,
                borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Contact us",
                      style: Theme.of(context).textTheme.headlineSmall),
                  Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 5,
                      children: [
                        const Icon(
                          Icons.mail_outline_rounded,
                          color: AppColors.neu900,
                          size: 20,
                        ),
                        Text("sarnfan@gmail.com",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ]),
                  Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 5,
                      children: [
                        const Icon(
                          Icons.phone,
                          color: AppColors.neu900,
                          size: 20,
                        ),
                        Text("066-8754599",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ]),
                  Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 5,
                      children: [
                        const Icon(
                          Icons.person_outline_rounded,
                          color: AppColors.neu900,
                          size: 20,
                        ),
                        InkWell(
                          onTap: () {
                            context.go("https://www.instagram.com/nonsomroop/");
                          },
                          child: Text("sarnfan.official",
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ]),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }
}
