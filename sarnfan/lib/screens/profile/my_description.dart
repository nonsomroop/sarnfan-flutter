import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sarnfan/providers/app_provider.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/white_surface.dart';

class MyDescriptionPage extends StatelessWidget {
  const MyDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.neu50,
          ),
          onPressed: () {
            context.go("/my-profile");
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
                          Text("Description",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: AppColors.pri500)),
                          IconButton(
                              onPressed: () {
                                context.push("/edit-description");
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: AppColors.pri500,
                              ))
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Text(appProvider.description ?? "No description yet",
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
