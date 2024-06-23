import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarnfan/themes/color_theme.dart';

class ProfileCard extends StatelessWidget {
  final String picture;
  final String email;
  final String phone;
  final String username;
  final String social;
  const ProfileCard(
      {super.key,
      required this.picture,
      required this.email,
      required this.phone,
      required this.username,
      required this.social});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.neu50,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(AppColors.neu50),
          overlayColor: WidgetStatePropertyAll<Color>(AppColors.neu200),
        ),
        onPressed: () {
          context.go("/other-profile/$username");
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 80,
                height: 120,
                child: Image(
                  image: AssetImage("assets/images/profile.png"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    username,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 5,
                      children: [
                        const Icon(
                          Icons.mail_outline_rounded,
                          color: AppColors.neu900,
                          size: 20,
                        ),
                        Text(email,
                            style: Theme.of(context).textTheme.bodySmall),
                      ]),
                  Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 5,
                      children: [
                        const Icon(
                          Icons.phone_outlined,
                          color: AppColors.neu900,
                          size: 20,
                        ),
                        Text(phone,
                            style: Theme.of(context).textTheme.bodySmall),
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
                        Text(social,
                            style: Theme.of(context).textTheme.bodySmall),
                      ]),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.neu900,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
