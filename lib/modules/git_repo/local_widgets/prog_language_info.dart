import 'package:flutter/material.dart';

import '../../../core/constants/color_constants.dart';

class ProgLanguageInfo extends StatelessWidget {
  const ProgLanguageInfo({
    super.key,
    required this.language,
    this.fontSize = 12.0,
  });

  final String language;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.circle_rounded,
          size: fontSize,
          color: ColorConstants.getColorByLanguage(language),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          language,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
