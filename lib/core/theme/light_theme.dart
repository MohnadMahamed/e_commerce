import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primarySwatch: Colors.green,
  scaffoldBackgroundColor: AppColors.lighBackGroundColor,
  appBarTheme: AppBarTheme(
      titleSpacing: 20,
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: AppColors.lighBackGroundColor,
      elevation: 0.0,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.lighBackGroundColor,
        statusBarIconBrightness: Brightness.dark,
      )),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white70,
      elevation: 20.0),
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.cairo(
        fontSize: 30.0, fontWeight: FontWeight.w700, color: Colors.black54),
    bodyMedium: GoogleFonts.cairo(
        fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.black87),
    displayLarge: GoogleFonts.kanit(
        fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),
    displaySmall: GoogleFonts.kanit(
        fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),
  ),
);
