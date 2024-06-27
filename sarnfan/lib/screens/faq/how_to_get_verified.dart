import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/bottom_nav.dart';
import 'package:sarnfan/widgets/flutter_easy_faq.dart';

class HowToGetVerified extends StatelessWidget {
  const HowToGetVerified({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pri500,
        foregroundColor: AppColors.neu50,
        titleSpacing: 5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop(context);
          },
        ),
        title: Text(
          'How to get verified',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: AppColors.neu50),
        ),
      ),
      bottomNavigationBar: const BottomNav(path: "/how-to-get-verified"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(  // Wrap the EasyFaq widgets in a Column
            children: [
              EasyFaq(
                question: "Why Verification is Important",
                answer: "Purpose: Explain the purpose of verification and its benefits, such as increased trust, better visibility, and access to additional features.\n\nTrust: Emphasize that verification helps build trust within the community, ensuring that requests and campaigns are legitimate.",
                image: Image.asset('assets/images/marked.png'),
                collapsedIcon: const Icon(Icons.keyboard_arrow_down_outlined),
                expandedIcon: const Icon(Icons.keyboard_arrow_up_outlined),
              ),
              const SizedBox(height: 14),
              EasyFaq(
                question: "Required Information and Documents",
                answer: "Personal Information: Detail the personal information required, such as full name, email address, phone number, and profile picture.\n\nDocumentation: Specify the types of documents needed for verification (e.g., government-issued ID, proof of address, organizational affiliation).\n\nOrganizational Verification: If applicable, outline the additional documents needed for organizations (e.g., registration certificate, tax identification number).",
                image: Image.asset('assets/images/iso9001.png'),
                collapsedIcon: const Icon(Icons.keyboard_arrow_down_outlined),
                expandedIcon: const Icon(Icons.keyboard_arrow_up_outlined),
              ),
              const SizedBox(height: 14),
              EasyFaq(
                question: "Step-by-Step Verification Process", 
                answer: '1. Profile Completion: Instruct users to ensure their profile is complete with up-to-date information.\n\n2. Submit Request: submit a verification request through our email by attaching all of the required documents.\n\n3. Review Process: Admin will need at least one week to review your submitted documents.\n\n4.Notification: User will get a notification via email after the review pass SarnFan verification criteria and a badge the show that user verified.',
                image: Image.asset('assets/images/mail.png'),
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
