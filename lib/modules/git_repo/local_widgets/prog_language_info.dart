import 'package:flutter/material.dart';

import '../../../core/constants/color_constants.dart';

class ProgLanguageInfo extends StatelessWidget {
  const ProgLanguageInfo({
    super.key,
    required this.language,
  });

  final String language;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.circle_rounded,
          size: 12.0,
          color: ColorConstants.getColorByLanguage(language),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          language,
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
