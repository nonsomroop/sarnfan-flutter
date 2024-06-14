import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/white_surface.dart';

class MyLocationPage extends StatelessWidget {
  const MyLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.neu50,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.pri500,
      ),
      backgroundColor: AppColors.pri500,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            WhiteSurface(
              minHeight: MediaQuery.of(context).size.height - 80,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 30, bottom: 10, left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Location",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: AppColors.pri500)),
                          IconButton(
                              onPressed: () {
                                context.go("/edit-location");
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: AppColors.pri500,
                              ))
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      color: AppColors.neu700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
                        style: Theme.of(context).textTheme.bodyMedium),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
