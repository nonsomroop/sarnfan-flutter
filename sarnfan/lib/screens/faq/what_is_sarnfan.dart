import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/bottom_nav.dart';

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
            Navigator.pop(context);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: AppColors.neu50,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to SarnFan',
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  color: AppColors.neu900,
                                ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'SarnFan is a vibrant community platform where users can share their thoughts, ideas, and experiences with others. Our mission is to connect people through shared interests and foster a sense of belonging.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Our Features',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: AppColors.neu900,
                                ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '- Post Sharing: Share your thoughts, ideas, and experiences with the community.\n'
                        '- Community Engagement: Like, comment, and share posts to engage with others.\n'
                        '- Discover Content: Explore a variety of posts from different categories and interests.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Get Started',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: AppColors.neu900,
                                ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Join SarnFan today and start sharing your stories with a vibrant community. Sign up now and be part of something special!',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
