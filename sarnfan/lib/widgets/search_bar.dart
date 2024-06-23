import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';

class SearchField extends StatefulWidget {
  final TextEditingController controller;

  final Function(String) searchKeyword;
  const SearchField(
      {super.key, required this.controller, required this.searchKeyword});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Search for posts",
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: AppColors.neu50),
        ),
        const SizedBox(height: 5),
        TextFormField(
          maxLines: 1,
          scrollPadding: const EdgeInsets.all(20),
          controller: widget.controller,
          decoration: InputDecoration(
              hintText: "e.g. post title, content, etc.",
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      await widget.searchKeyword(widget.controller.text);
                    }),
              )),
        )
      ],
    );
  }
}
