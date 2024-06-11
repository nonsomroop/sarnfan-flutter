import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/create-post/create_post_item.dart';
import 'package:sarnfan/widgets/create-post/select_tag_item.dart';
import 'package:sarnfan/widgets/text_input.dart';
import 'package:sarnfan/widgets/white_surface.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pri500,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: AppColors.neu50,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      fixedSize:
                          WidgetStateProperty.all<Size>(const Size(110, 35)),
                      backgroundColor:
                          WidgetStateProperty.all<Color>(AppColors.pri700)),
                  child: Text("Post")),
            )
          ],
          titleSpacing: 10,
          title: Text(
            "Create Post",
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.neu50),
          ),
          backgroundColor: AppColors.pri500),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            WhiteSurface(
              minHeight: MediaQuery.of(context).size.height - 100,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child: CustomTextInput(
                        title: "Post Title",
                        placeholder: "",
                        titleColor: AppColors.neu700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child: CustomTextInput(
                        title: "Description",
                        placeholder: "Description",
                        titleColor: AppColors.neu700,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        child: CreatePostItem(
                            text: "Add Photos",
                            icon: Icons.photo_rounded,
                            color: AppColors.pri600)),
                    Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        child: CreatePostItem(
                            text: "Add Location",
                            icon: Icons.location_on_outlined,
                            color: AppColors.sec600)),
                    Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        child: Text(
                          "Select Activity",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: AppColors.neu900),
                        )),
                    Row(
                      children: [
                        SelectTagItem(text: "Volunteer", isSelected: false),
                        SelectTagItem(text: "Donation", isSelected: false),
                        SelectTagItem(text: "Workshop", isSelected: false),
                        SelectTagItem(text: "Other", isSelected: false)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
