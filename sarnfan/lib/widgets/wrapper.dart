import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  final Widget child;
  const Wrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
            maxWidth: 576, minHeight: MediaQuery.of(context).size.height),
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
