import 'package:flutter/material.dart';

class TopicDataLine extends StatelessWidget {
  const TopicDataLine({
    super.key,
    required this.topic,
    required this.data,
    this.fontSize = 15.0,
  });

  final String topic;
  final String data;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "$topic:",
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          data,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}


