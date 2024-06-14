import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/white_surface.dart';

class MyDescriptionPage extends StatelessWidget {
  const MyDescriptionPage({super.key});

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
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse consequat mauris egestas ex interdum fermentum et eu tortor. Aliquam eu tristique sapien, vitae rutrum diam. Aliquam quis ipsum ex. Sed mauris arcu, rhoncus sed iaculis quis, consequat in sapien. Vivamus nibh ligula, iaculis quis molestie vel, pretium in mi. Mauris id orci eget sem efficitur commodo. Phasellus et magna in dui eleifend lobortis ac gravida elit. Cras consectetur, quam malesuada gravida consectetur, ante risus dictum ligula, at egestas sapien orci ut metus. Sed non euismod est. Sed magna dolor, convallis sit amet leo id, fermentum luctus risus. Curabitur malesuada ornare ultricies. Mauris dolor ipsum, pulvinar nec lorem sed, interdum tempor mauris. Aliquam erat volutpat.",
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
