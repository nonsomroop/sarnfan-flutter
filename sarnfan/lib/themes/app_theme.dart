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
    scaffoldBackgroundColor: AppColors.neu100,

    // primaryColor: AppColors.yellow,

    // * APP BAR THEME
    // appBarTheme: AppBarTheme(
    //   backgroundColor: AppColors.neu100,
    //   elevation: 0,
    //   // iconTheme: const IconThemeData(color: AppColors.neu900),
    //   titleTextStyle: const TextStyle(
    //     color: AppColors.neu900,
    //     fontWeight: FontWeight.w600,
    //     fontSize: 20,
    //   ),
    // ),
// * App Bar Theme
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.amber,
        elevation: 0,
        toolbarHeight: 60,
        titleTextStyle: TextStyle(
          fontFamily: GoogleFonts.lexend().fontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 22,
          height: 1.5,
        ),
        centerTitle: false, titleSpacing: 30),
    // * Bottom Bar Theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.neu100,
      elevation: 0,
      selectedItemColor: AppColors.pri500,
    ),

    // * Text Button
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      // foregroundColor: WidgetStateProperty.all<Color>(
      //   AppColors.neu500,
      // ),
      backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
      overlayColor: WidgetStateProperty.all<Color>(
        AppColors.neu50.withOpacity(0.0),
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      textStyle: WidgetStateProperty.all<TextStyle>(
        TextStyle(
          fontFamily: GoogleFonts.lexend().fontFamily,
          fontWeight: FontWeight.w300,
          fontSize: 16,
          color: AppColors.neu50,
        ),
      ),
      // fixedSize: WidgetStateProperty.all<Size>(
      //   const Size.fromHeight(50),
      // ),
      elevation:
          WidgetStateProperty.all<double>(0), // Remove the elevation here
    )),
    // * Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all<Color>(
        AppColors.neu50,
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      textStyle: WidgetStateProperty.all<TextStyle>(
        TextStyle(
          fontFamily: GoogleFonts.lexend().fontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: AppColors.neu50,
        ),
      ),
      fixedSize: WidgetStateProperty.all<Size>(
        const Size.fromHeight(50),
      ),
      elevation:
          WidgetStateProperty.all<double>(0), // Remove the elevation here
    )),
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
//* TextFormField

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 2.0, color: AppColors.neu300),
        borderRadius: BorderRadius.circular(30.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2.0, color: AppColors.neu300),
        borderRadius: BorderRadius.circular(30.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2.0, color: AppColors.pri600),
        borderRadius: BorderRadius.circular(30.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2.0, color: AppColors.red500),
        borderRadius: BorderRadius.circular(30.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2.0, color: AppColors.red500),
        borderRadius: BorderRadius.circular(30.0),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2.0, color: AppColors.neu400),
        borderRadius: BorderRadius.circular(30.0),
      ),
      fillColor: AppColors.neu50,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      labelStyle: const TextStyle(
          color: AppColors.neu900, fontWeight: FontWeight.w500, fontSize: 16),
      hintStyle: const TextStyle(
          color: AppColors.neu400, fontWeight: FontWeight.w300, fontSize: 14),
    ),

    // * TEXT THEME
    textTheme: const TextTheme(
      headlineLarge:
          TextStyle(fontWeight: FontWeight.w600, fontSize: 32, height: 1.5),
      headlineMedium:
          TextStyle(fontWeight: FontWeight.w600, fontSize: 28, height: 1.5),
      headlineSmall:
          TextStyle(fontWeight: FontWeight.w600, fontSize: 24, height: 1.5),
      titleLarge:
          TextStyle(fontWeight: FontWeight.w600, fontSize: 22, height: 1.5),
      titleMedium:
          TextStyle(fontWeight: FontWeight.w600, fontSize: 16, height: 1.5),
      titleSmall:
          TextStyle(fontWeight: FontWeight.w600, fontSize: 14, height: 1.5),
      labelLarge:
          TextStyle(fontWeight: FontWeight.w500, fontSize: 14, height: 1.5),
      labelMedium:
          TextStyle(fontWeight: FontWeight.w500, fontSize: 12, height: 1.5),
      labelSmall:
          TextStyle(fontWeight: FontWeight.w500, fontSize: 11, height: 1.5),
      bodyLarge: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 16,
          height: 1.5,
          color: AppColors.neu900),
      bodyMedium:
          TextStyle(fontWeight: FontWeight.w300, fontSize: 14, height: 1.5),
      bodySmall:
          TextStyle(fontWeight: FontWeight.w300, fontSize: 12, height: 1.5),
    ),

    expansionTileTheme: const ExpansionTileThemeData(
        shape: Border(), backgroundColor: Colors.white),
  );
}
