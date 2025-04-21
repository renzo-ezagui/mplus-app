import 'package:flutter/material.dart';

class AppTheme {
  static const Color darkSlate = Color(0xFF2E5D62);
  static const Color ashGray = Color(0xFFB0C7BD);
  static const Color frenchGray = Color(0xFFA4A5AE);
  static const Color lavender = Color(0xFFE5E0F3);
  static const Color isabelline = Color(0xFFF3F0EB);

  static ThemeData get light => ThemeData(
    primaryColor: darkSlate,
    scaffoldBackgroundColor: isabelline,
    fontFamily: 'SansSerif',
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: lavender),
  );
}
