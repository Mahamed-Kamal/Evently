import 'package:evently/core/app_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkTheme extends BaseTheme {
  @override
  Color get backgroundColor => Color(0xFF101127);

  @override
  Color get primaryColor => Color(0xFF5669FF);

  @override
  Color get textColor => Color(0xFFF4EBDC);

  @override
  ThemeData get themeData => ThemeData(
    primaryColor: primaryColor,
    focusColor: const Color(0xFFF4EBDC),
    hintColor: primaryColor,
    secondaryHeaderColor: backgroundColor,
    scaffoldBackgroundColor: backgroundColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: backgroundColor,
      shape: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(75),),
        borderSide: BorderSide(width: 5, color: Colors.white),
      ),
    ),
    appBarTheme: AppBarTheme(
      surfaceTintColor: backgroundColor,
      backgroundColor: backgroundColor,
      centerTitle: true,
      iconTheme: IconThemeData(color: primaryColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
    ),
    textTheme: TextTheme(
      titleMedium: GoogleFonts.inter(
        fontSize: 20,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 16,
        color: primaryColor,
        fontWeight: FontWeight.bold,
        decorationColor: primaryColor,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 20,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 16,
        color: textColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: primaryColor,
        padding: const EdgeInsets.all(16),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: primaryColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.red),
      ),
      prefixIconColor: Colors.white,
      suffixIconColor: Colors.white,
    ),
  );
}
