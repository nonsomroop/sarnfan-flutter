import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';

class UserType extends StatelessWidget {
  final String type;
  const UserType({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 5,
        children: [
          Icon(
            type == "ind"
                ? Icons.person_2_rounded
                : type == "org"
                    ? Icons.groups_2_rounded
                    : type == "school"
                        ? Icons.school_rounded
                        : Icons.question_mark_rounded,
            color: AppColors.pri600,
            size: 20,
          ),
          Text(
              type == "ind"
                  ? "Individual"
                  : type == "org"
                      ? "Organization"
                      : type == "school"
                          ? "School"
                          : "",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: AppColors.pri600)),
        ]);
  }
}
