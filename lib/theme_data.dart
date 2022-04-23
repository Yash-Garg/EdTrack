import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const Color accentBlue = Color.fromARGB(255, 0, 85, 255);
  static Color mildBlack = Colors.black.withOpacity(.6);
  static String? fontFamily = GoogleFonts.poppins().fontFamily;
  static const double cardRadius = 16;

  static const TextStyle titleMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 1,
  );

  static TextStyle bodySmall = AppTheme.titleMedium.copyWith(
    color: Colors.black,
    fontSize: 16,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bodyMedium = AppTheme.titleMedium.copyWith(
    fontSize: 14,
    color: AppTheme.mildBlack,
  );

  static ThemeData themeData = ThemeData(
    primaryColor: accentBlue,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ThemeData().scaffoldBackgroundColor,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black),
      elevation: 0,
    ),
    fontFamily: fontFamily,
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: mildBlack,
      suffixIconColor: Colors.black,
      labelStyle: TextStyle(color: Colors.black),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: accentBlue, width: 2.0),
      ),
    ),
  );

  static const cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(cardRadius)),
  );

  static Color getColor(double percentage) {
    Color color = Colors.blueAccent;

    if (percentage >= 75.0) {
      color = Colors.green;
    } else if (percentage <= 50.0) {
      color = Colors.redAccent;
    } else if (percentage < 75.0 && percentage > 50.0) {
      color = Colors.orangeAccent;
    }
    return color;
  }
}
