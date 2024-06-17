import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';

class CustomTextInput extends StatefulWidget {
  final String title;
  final String placeholder;
  final Color titleColor;
  final TextEditingController? controller;
  final bool obscureText;
  final bool emptyValidator;

  const CustomTextInput(
      {super.key,
      required this.title,
      required this.placeholder,
      required this.titleColor,
      this.controller,
      this.obscureText = false,
      this.emptyValidator = false});

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        widget.title,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: widget.titleColor),
      ),
      TextFormField(
        decoration: InputDecoration(
          hintText: widget.placeholder,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.neu400),
        ),
        obscureText: widget.obscureText,
        controller: widget.controller,
        validator: (widget.emptyValidator)
            ? (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter ${widget.title.toLowerCase()}';
                }
                return null;
              }
            : null,
      )
    ]);
  }
}
