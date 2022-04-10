import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const Color accentBlue = Color.fromARGB(255, 0, 85, 255);
  static Color mildBlack = Colors.black.withOpacity(.6);
  static String? fontFamily = GoogleFonts.poppins().fontFamily;

  static ThemeData themeData = ThemeData(
    primaryColor: accentBlue,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ThemeData().scaffoldBackgroundColor,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
    ),
    fontFamily: fontFamily,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: mildBlack,
      suffixIconColor: Colors.black,
      labelStyle: TextStyle(color: Colors.black),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: accentBlue, width: 2.0),
      ),
    ),
  );
}
