import 'package:evently/core/app_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme extends BaseTheme {
  @override
  Color get backgroundColor => Color(0xFFF2FEFF);

  @override
  Color get primaryColor => Color(0xFF5669FF);

  @override
  Color get textColor => Color(0xFF1C1C1C);

  @override
  ThemeData get themeData => ThemeData(
    primaryColor: primaryColor,
    hintColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      surfaceTintColor: backgroundColor,
      backgroundColor: backgroundColor,
      centerTitle: true,
      iconTheme: IconThemeData(color: primaryColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
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
        color: Color(0xFF7B7B7B),
        fontWeight: FontWeight.w500,
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
        padding: EdgeInsets.all(16),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Color(0xFF7B7B7B)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Color(0xFF7B7B7B)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Color(0xFF7B7B7B)),
      ),
      prefixIconColor: Color(0xFF7B7B7B),
      suffixIconColor: Color(0xFF7B7B7B),
    ),
    dividerColor: primaryColor,
    dividerTheme: DividerThemeData(color: primaryColor),
  );
}
