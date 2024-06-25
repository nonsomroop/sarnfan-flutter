import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                        'SarnFan is an application designed to facilitate organizations, such as schools and charities, in requesting assistance for various needs. Whether they are seeking charitable donations or support for volunteer activities aimed at addressing insufficiencies or driving improvements, Sarnfan serves as a platform to connect these organizations with potential helpers. By streamlining the process of soliciting and providing aid, Sarnfan aims to enhance the effectiveness of charitable efforts and organizational development.',
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
                        '- Assistance Requests: Schools and organizations can post their requests for financial donations, volunteer services, and resources, including contact information, detailed descriptions, and specific needs outlined for potential helpers.\n'
                        'Search Functionality: Allow user to search for specific requests using keywords and filters.\n'
                        '- Profile Customization: Users can customized their information to effectively show accurate backgrounds and contact information\n'
                        '- Star Requests: Users can star posts that interest them to their profile for easy access and reference\n',
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
