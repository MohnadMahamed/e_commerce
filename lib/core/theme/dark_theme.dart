import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: AppColors.darkBackGroundColor,
  primarySwatch: Colors.green,
  appBarTheme: AppBarTheme(
      titleSpacing: 20,
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: AppColors.darkBackGroundColor,
      elevation: 0.0,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.darkBackGroundColor,
        statusBarIconBrightness: Brightness.light,
      )),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.green,
      backgroundColor: Colors.black87,
      elevation: 20.0),
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.cairo(
        fontSize: 30.0, fontWeight: FontWeight.w700, color: Colors.white70),
    bodyMedium: GoogleFonts.cairo(
        fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.white),
    displayLarge: GoogleFonts.kanit(
        fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
    displaySmall: GoogleFonts.kanit(
        fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white),
  ),
);
