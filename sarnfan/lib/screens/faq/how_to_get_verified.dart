import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/bottom_nav.dart';
import 'package:flutter_easy_faq/flutter_easy_faq.dart';

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
      bottomNavigationBar: const BottomNav(path: "/how-to-use"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(  // Wrap the EasyFaq widgets in a Column
            children: [
              EasyFaq(
                question: "Why Verification is Important",
                answer: "Purpose: Explain the purpose of verification and its benefits, such as increased trust, better visibility, and access to additional features.\n\nTrust: Emphasize that verification helps build trust within the community, ensuring that requests and campaigns are legitimate."
              ),
              const SizedBox(height: 10),
              EasyFaq(
                question: "Required Information and Documents",
                answer: "Personal Information: Detail the personal information required, such as full name, email address, phone number, and profile picture.\n\nDocumentation: Specify the types of documents needed for verification (e.g., government-issued ID, proof of address, organizational affiliation).\n\nOrganizational Verification: If applicable, outline the additional documents needed for organizations (e.g., registration certificate, tax identification number).",
              ),
              const SizedBox(height: 10),
              EasyFaq(
                question: "Step-by-Step Verification Process", 
                answer: "Profile Completion: Instruct users to ensure their profile is complete with up-to-date information.\n\nSubmit Request: Explain how to submit a verification request, including where to upload documents and how to fill out the verification form.\n\nReview Process: Provide an overview of the review process, including how long it typically takes and who will review the documents.\n\nNotification: Inform users how they will be notified about the status of their verification request (e.g., email)."
              ),  
            ],
          ),
        ),
      ),
    );
  }
}
