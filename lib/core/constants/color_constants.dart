import 'package:flutter/widgets.dart';

class ColorConstants {
  static const Map<String, String> languageColorMap = {
    'PYTHON': '#3572A5',
    'JAVA': '#007396',
    'JAVASCRIPT': '#F7DF1E',
    'C++': '#00599C',
    'C#': '#178600',
    'RUBY': '#CC342D',
    'SWIFT': '#FFAC45',
    'GO': '#00ADD8',
    'PHP': '#4F5D95',
    'R': '#276DC3',
    'KOTLIN': '#F18E33',
    'TYPESCRIPT': '#007ACC',
    'SCALA': '#DC322F',
    'RUST': '#6D6D78',
    'HTML': '#E34F26',
    'CSS': '#264DE4',
    'SQL': '#FFD700',
    'PERL': '#39457E',
    'ASSEMBLY': '#6E4C13',
    'HASKELL': '#5E5086',
    'LUA': '#000080',
    'SHELL SCRIPTING (BASH)': '#89e051',
    'OBJECTIVE-C': '#438eff',
    'DART': '#00B4AB',
    'MATLAB': '#0076A8',
    'SCRATCH': '#4D97FF',
  };

  static Color getColorByLanguage(String language) {
    // Default color if language not found
    String defaultColorHex = '#808080';

    // Convert language to uppercase to match keys in languageColorMap
    String languageKey = language.toUpperCase();

    // Check if the language is in the map
    if (languageColorMap.containsKey(languageKey)) {
      String colorHex = languageColorMap[languageKey]!;
      return Color(
        int.parse(
              colorHex.substring(1),
              radix: 16,
            ) +
            0xFF000000,
      );
    } else {
      // Return default color if language not found
      return Color(
        int.parse(
              defaultColorHex.substring(1),
              radix: 16,
            ) +
            0xFF000000,
      );
    }
  }
}
