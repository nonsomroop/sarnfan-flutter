import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/bottom_nav.dart';
import 'package:flutter_easy_faq/flutter_easy_faq.dart';

class WhatIsSarnFanPage extends StatelessWidget {
  const WhatIsSarnFanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pri500,
        foregroundColor: AppColors.neu50,
        titleSpacing: 5,
        leading: IconButton(
          // padding: const EdgeInsets.only(left: 20),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop(context);
          },
        ),
        title: Text('What is SarnFan',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppColors.neu50)),
      ),
      bottomNavigationBar: const BottomNav(path: "/what-is-sarnfan"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(  // Wrap the EasyFaq widgets in a Column
            children: [
              EasyFaq(
                question: "Welcome to SarnFan",
                questionTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                answer: "SarnFan is an application designed to facilitate organizations, such as schools and charities, in requesting assistance for various needs. Whether they are seeking charitable donations or support for volunteer activities aimed at addressing insufficiencies or driving improvements, Sarnfan serves as a platform to connect these organizations with potential helpers. By streamlining the process of soliciting and providing aid, Sarnfan aims to enhance the effectiveness of charitable efforts and organizational development.",
                anserTextStyle: const TextStyle(fontSize: 14),
                collapsedIcon: const Icon(Icons.keyboard_arrow_down_outlined),
                expandedIcon: const Icon(Icons.keyboard_arrow_up_outlined),
              ),
              const SizedBox(height: 14),
              EasyFaq(
                question: "Our Features",
                questionTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                answer: "- Assistance Requests: Schools and organizations can post their requests for financial donations, volunteer services, and resources, including contact information, detailed descriptions, and specific needs outlined for potential helpers.\n\n- Search Functionality: Allow user to search for specific requests using keywords and filters.\n\n- Profile Customization: Users can customized their information to effectively show accurate backgrounds and contact information\n\n- Star Requests: Users can star posts that interest them to their profile for easy access and reference",
                anserTextStyle: const TextStyle(fontSize: 14),
                collapsedIcon: const Icon(Icons.keyboard_arrow_down_outlined),
                expandedIcon: const Icon(Icons.keyboard_arrow_up_outlined),
              ),
              const SizedBox(height: 14),
              EasyFaq(
                question: "Get Started", 
                questionTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                answer: "Join SarnFan today and start sharing your stories with a vibrant community. Sign up now and be part of something special!",
                anserTextStyle: const TextStyle(fontSize: 14),
                collapsedIcon: const Icon(Icons.keyboard_arrow_down_outlined),
                expandedIcon: const Icon(Icons.keyboard_arrow_up_outlined),
              ),  
            ],
          ),
        ),
      ),
    );
  }
}