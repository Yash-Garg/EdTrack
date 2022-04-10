import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const Color accentBlue = Color.fromARGB(255, 0, 85, 255);

  static ThemeData themeData = ThemeData(
    primaryColor: accentBlue,
    appBarTheme: AppBarTheme(centerTitle: true),
    fontFamily: GoogleFonts.poppins().fontFamily,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
