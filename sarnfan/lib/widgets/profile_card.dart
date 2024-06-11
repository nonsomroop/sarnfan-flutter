import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.neu50,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll<Color>(AppColors.neu50),
          overlayColor: WidgetStatePropertyAll<Color>(AppColors.neu200),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 80,
                height: 120,
                child: Image(
                  image: AssetImage("assets/images/profile.png"),
                ),
              ),
              // SizedBox(
              //   width: 20,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "John Doe",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text("johndoe@gmail.com",
                      style: Theme.of(context).textTheme.bodySmall),
                  Text("+66231231",
                      style: Theme.of(context).textTheme.bodySmall),
                  Text("johndoe23",
                      style: Theme.of(context).textTheme.bodySmall)
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
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
