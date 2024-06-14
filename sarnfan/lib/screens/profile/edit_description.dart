import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';
import 'package:sarnfan/widgets/white_surface.dart';

class EditDescriptionPage extends StatefulWidget {
  const EditDescriptionPage({super.key});

  @override
  State<EditDescriptionPage> createState() => _EditDescriptionPageState();
}

class _EditDescriptionPageState extends State<EditDescriptionPage> {
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
        titleSpacing: 10,
        title: Text("Edit Description",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.neu50)),
        backgroundColor: AppColors.pri500,
      ),
      backgroundColor: AppColors.pri500,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: WhiteSurface(
                        minHeight: MediaQuery.of(context).size.height - 80,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, bottom: 10, left: 30, right: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Description",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(color: AppColors.pri500)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30, right: 30),
                              child: TextField(
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                    hintText: "Enter your description here",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: AppColors.neu400),
                                    border: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.pri500, width: 2)),
                                    focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.pri500, width: 2)),
                                    enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.pri500,
                                            width: 2))),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 50, bottom: 30),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: OutlinedButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "Cancel",
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStateProperty.all<
                                                    Color>(AppColors.pri500)),
                                        child: const Text(
                                          "Save",
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
