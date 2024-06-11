import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';

class TextInput extends StatefulWidget {
  final String title;
  final String placeholder;

  const TextInput({super.key, required this.title, required this.placeholder});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        widget.title,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: AppColors.neu50),
      ),
      TextFormField(
        decoration: InputDecoration(
          hintText: widget.placeholder,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.neu400),
        ),
      )
    ]);
  }
}
