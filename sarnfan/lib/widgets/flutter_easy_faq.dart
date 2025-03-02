// ignore_for_file: must_be_immutable

library flutter_easy_faq;

import 'package:flutter/material.dart';

final class EasyFaq extends StatefulWidget {
  final String question;
  final String answer;
  final Image? image;
  TextStyle? questionTextStyle;
  TextStyle? answerTextStyle;
  Duration? duration = const Duration(milliseconds: 100);
  Widget? expandedIcon;
  Widget? collapsedIcon;
  Color? backgroundColor;
  BorderRadiusGeometry? borderRadius;
  EdgeInsetsGeometry? padding = const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 10,
  );

  EasyFaq({
    super.key,
    required this.question,
    required this.answer,
    this.questionTextStyle,
    this.answerTextStyle,
    this.expandedIcon,
    this.collapsedIcon,
    this.duration,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.image,
  });

  @override
  State<EasyFaq> createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<EasyFaq> with TickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Card(
        margin: EdgeInsets.zero,
        color: widget.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
        ),
        child: AnimatedSize(
          duration: widget.duration ??
              (isExpanded
                  ? const Duration(milliseconds: 120)
                  : const Duration(milliseconds: 80)),
          child: Container(
            padding: widget.padding ??
                const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.question,
                        style: widget.questionTextStyle ??
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                      ),
                    ),
                    if (isExpanded)
                      widget.expandedIcon ??
                          const Icon(
                            Icons.remove,
                            color: Color.fromRGBO(101, 101, 105, 1),
                          )
                    else
                      widget.collapsedIcon ??
                          const Icon(
                            Icons.add,
                            color: Color.fromRGBO(101, 101, 105, 1),
                          )
                  ],
                ),
                if (isExpanded) ...[
                  const SizedBox(height: 10),
                  Text(
                    widget.answer,
                    style: widget.answerTextStyle ??
                        Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                  ),
                  if (widget.image != null) ...[
                    const SizedBox(height: 10),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0), // Rounded rectangular shape
                        child: widget.image!,
                      ),
                    )
                  ],
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
