import 'package:flutter/material.dart';

class CircularChip extends StatelessWidget {
  const CircularChip({
    super.key,
    required this.text,
    this.fontSize = 8.0,
  });

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              15.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 2.0,
            horizontal: 8.0,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
