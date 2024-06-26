import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/bottom_nav.dart';
import 'package:flutter_easy_faq/flutter_easy_faq.dart';

class HowToUsePage extends StatelessWidget {
  const HowToUsePage({super.key});

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
          'How to use',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: AppColors.neu50),
        ),
      ),
      bottomNavigationBar: const BottomNav(path: "/how-to-use"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              EasyFaq(
                question: "How to Edit Profile if We Already Registered?",
                questionTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                answer: "Click Edit Profile (Pencil icon) on your profile page. On the edit profile page, tap or click on your profile image to select a new profile image or remove profile image. Also, you can update display name, phone number, and social media on edit profile page too. Click or tap save button to update your changes.",
                anserTextStyle: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 14),
              EasyFaq(
                question: "Creating and Managing Requests",
                questionTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                answer: "Creating a New Post\n - Tap the Create Post button. Enter a title, detailed description, add relevant photos, and specify the location, activities and, region. Tap Submit to post your request.\n\nReporting Post\n - Tap on a post that you feel inappropiate or doesn't match the description. Then, write why that post should be banned and click submit button for admin to review.",
                anserTextStyle: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 14),
              EasyFaq(
                question: "How to use starred page", 
                questionTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                answer: "Click or tap on to the post that you interested in. On the top right corner of that description post you can see the star icon. Click or tap star icon to add that post into starred page for you to come back and review later.",
                anserTextStyle: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 14),
              EasyFaq(
                question: "Can we able to know what post we recently visited?",
                questionTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                answer: "There is a history Page that tracking on your browsing. In that page you can find all of your recenlty viewed post!",
                anserTextStyle: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 14),
              EasyFaq(
                question: "How to use the search or filter feature?",
                questionTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), 
                answer: "On the search page, there are many fields that let's user to customize to find the most match post based on their own preferences",
                anserTextStyle: const TextStyle(fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}