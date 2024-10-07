import 'package:flutter/material.dart';
import 'package:moderncreditapp/domain/core/theme/colors.dart';

// Dark Theme Configuration
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,

listTileTheme: ListTileThemeData(
  
),
  // Text theme applied to the body text
  textTheme: const TextTheme().apply(bodyColor: MyColors.iconColor),

  // Background color of the Scaffold
  scaffoldBackgroundColor: MyColors.backgroundColor,

  // Primary color used throughout the app
  primaryColor: MyColors.backgroundColor,

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: MyColors.backgroundColor,
      selectedItemColor: MyColors.iconColor,
      unselectedItemColor: MyColors.unselectedColor),

  // Floating action button theme configuration
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: MyColors.bottonColor,
  ),

  // Elevated button theme configuration
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(MyColors.bottonColor),
    ),
  ),

  // Dialog theme configuration
  dialogTheme: const DialogTheme(
    backgroundColor: MyColors.backgroundColor,
  ),

  // Checkbox theme configuration
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.all<Color>(
      MyColors.backgroundColor,
    ),
    checkColor:
        const WidgetStatePropertyAll(Color.fromARGB(255, 250, 250, 250)),
    side: BorderSide.none,
  ),

  // App bar theme configuration
  appBarTheme: const AppBarTheme(
    backgroundColor: MyColors.appBarColor,
  ),

  // Input decoration theme configuration
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    filled: true,
    fillColor: MyColors.appBarColor,
  ),
);

//....................................................................//
// Light Theme Configuration
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,

// Text theme applied to the body text
  textTheme: const TextTheme().apply(bodyColor: MyColors.iconLightColor),

  // Background color of the Scaffold
  scaffoldBackgroundColor: MyColors.backgroundLightColor,

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: MyColors.backgroundLightColor,
      selectedItemColor: MyColors.iconLightColor,
      unselectedItemColor: MyColors.unselectedLightColor),

  // Primary color used throughout the app
  primaryColor: MyColors.appBarLightColor,

  // Floating action button theme configuration
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: MyColors.backgroundLightColor,
  ),

  // Elevated button theme configuration
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor:
          WidgetStateProperty.all<Color>(MyColors.appBarLightColor),
      textStyle:
          const WidgetStatePropertyAll(TextStyle(color: MyColors.appBarColor)),
    ),
  ),

  // Dialog theme configuration
  dialogTheme: const DialogTheme(
    backgroundColor: MyColors.backgroundLightColor,
  ),

  // Checkbox theme configuration
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.all<Color>(
      MyColors.appBarColor,
    ),
    side: BorderSide.none,
  ),

  // App bar theme configuration
  appBarTheme: const AppBarTheme(
    backgroundColor: MyColors.appBarLightColor,
  ),

  // Input decoration theme configuration
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    filled: true,
    fillColor: MyColors.appBarLightColor,
  ),
);
