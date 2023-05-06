import 'package:flutter/material.dart';

class DescriptionMovie extends StatelessWidget {
  final String description;

  const DescriptionMovie({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(description),
      ],
    );
  }
}
