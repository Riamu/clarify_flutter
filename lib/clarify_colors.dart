import 'package:flutter/material.dart';

class ClarifyColors {
  static const Color _clarifyPrimaryColor = Color(0xFF306073);
  static MaterialColor clarifyPrimary =
      createMaterialColor(_clarifyPrimaryColor);

  static const Color _clarifySecondaryColor = Color(0xFF2196F3);
  static MaterialColor clarifySecondary =
      createMaterialColor(_clarifySecondaryColor);

  static const Color _clarifyTertiaryColor = Color(0xFFB4D2D9);
  static MaterialColor clarifyTertiary =
      createMaterialColor(_clarifyTertiaryColor);

  static const Color _clarifyAccent = Color(0xFFF2385A);
  static MaterialColor clarifyAccent = createMaterialColor(_clarifyAccent);

  static const Color _clarifyEarth = Color(0xFF8C673A);
  static MaterialColor clarifyEarth = createMaterialColor(_clarifyEarth);

  // Function that createsa material color from a given hex code.
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
