import 'package:flutter/material.dart';
import 'package:sarnfan/themes/color_theme.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

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
          scrollPadding: EdgeInsets.all(20),
          decoration: InputDecoration(
              hintText: "e.g. post title, content, etc.",
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(icon: Icon(Icons.search), onPressed: () {}),
              )),
        )
      ],
    );
  }
}
