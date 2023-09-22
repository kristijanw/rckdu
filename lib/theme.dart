import 'package:flutter/material.dart';

var theme = ThemeData(
  useMaterial3: true,

  //scaffoldBackgroundColor: Color.fromARGB(200, 252, 252, 252),
  // Define the default brightness and colors.
  //brightness: Brightness.dark,
  primaryColor: const Color(0xffC10230),
  scaffoldBackgroundColor: Colors.grey[50],

  // Define the default font family.
  //fontFamily: 'Georgia',

  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 36,
      fontStyle: FontStyle.italic,
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      height: 1.5,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
    bodySmall: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
  ),
  /*
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.green, //  <-- dark color
    textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color
  ),
  */
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(const Color(0xffC10230)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: const BorderSide(
            color: Color(0xffC10230),
          ),
        ),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(const Color(0xffC10230)),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      side: MaterialStateProperty.all(
        const BorderSide(color: Color(0xffC10230)),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
  ),
  listTileTheme: const ListTileThemeData(
    titleTextStyle: TextStyle(
      fontSize: 14,
      fontFamily: 'Poppins',
      color: Colors.black,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Color(0xffC10230),
    labelStyle: TextStyle(fontSize: 20, height: 1.5),
    unselectedLabelStyle: TextStyle(fontSize: 20, height: 1.5),
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: Color(0xffC10230)),
    ),
    indicatorSize: TabBarIndicatorSize.tab,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xffC10230),
    foregroundColor: Colors.white,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
  ),
);
