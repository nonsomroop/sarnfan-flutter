import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_theme.dart';

class AppTheme {
  static ThemeData get appTheme {
    return _appTheme;
  }

  static final ThemeData _appTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.lexend().fontFamily,
    // scaffoldBackgroundColor: AppColors.cream,
    // primaryColor: AppColors.yellow,
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ButtonStyle(
    //   backgroundColor: WidgetStateProperty.all<Color>(
    //     AppColors.yellow,
    //   ),
    //   foregroundColor: WidgetStateProperty.all<Color>(
    //     AppColors.white,
    //   ),
    //   shape: WidgetStateProperty.all<RoundedRectangleBorder>(
    //     RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //   ),
    //   textStyle: WidgetStateProperty.all<TextStyle>(
    //     const TextStyle(
    //       fontWeight: FontWeight.w800,
    //       fontSize: 18,
    //       color: AppColors.white,
    //     ),
    //   ),
    //   fixedSize: WidgetStateProperty.all<Size>(
    //     const Size.fromHeight(50),
    //   ),
    //   elevation:
    //       WidgetStateProperty.all<double>(0), // Remove the elevation here
    // )),
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: ButtonStyle(
    //     backgroundColor: WidgetStateProperty.all<Color>(AppColors.white),
    //     foregroundColor: WidgetStateProperty.all<Color>(
    //       AppColors.darkGrey,
    //     ),
    //     shape: WidgetStateProperty.all<RoundedRectangleBorder>(
    //       RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(10),
    //         side: const BorderSide(
    //           // Add this line to set border
    //           color: AppColors.lightGrey, // Set the color of the border
    //           width: 1, // Set the width of the border
    //         ),
    //       ),
    //     ),
    //     textStyle: WidgetStateProperty.all<TextStyle>(
    //       const TextStyle(
    //         fontWeight: FontWeight.w500,
    //         fontSize: 18,
    //         color: AppColors.darkGrey,
    //       ),
    //     ),
    //     fixedSize: WidgetStateProperty.all<Size>(const Size.fromHeight(50)),
    //     elevation:
    //         WidgetStateProperty.all<double>(0), // Remove the elevation here
    //   ),
    // ),
    // textTheme: const TextTheme(
    //   headlineLarge: TextStyle(
    //       fontWeight: FontWeight.w600, fontSize: 40, color: AppColors.darkGrey),
    //   headlineMedium: TextStyle(
    //       fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.darkGrey),
    //   headlineSmall: TextStyle(
    //       fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.darkGrey),
    //   bodyLarge: TextStyle(
    //       fontWeight: FontWeight.w500, fontSize: 20, color: AppColors.darkGrey),
    //   bodyMedium: TextStyle(
    //       fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.darkGrey),
    //   bodySmall: TextStyle(
    //       fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.darkGrey),
    // ),

    expansionTileTheme: const ExpansionTileThemeData(
        shape: Border(), backgroundColor: Colors.white),
  );
}
