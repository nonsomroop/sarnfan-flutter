import 'package:flutter/material.dart';

class CancelBox extends StatelessWidget {
  Function()? function;

  CancelBox({super.key, this.function});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8.0,
      right: 8.0,
      child: GestureDetector(
        onTap: function,
        child: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.cancel,
            color: Colors.white,
            size: 24.0,
          ),
        ),
      ),
    );
  }
}
