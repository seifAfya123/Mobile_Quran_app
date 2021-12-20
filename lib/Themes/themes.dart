import 'package:flutter/material.dart';

class MyThemeData {
  static const Color primaryColor = Color.fromARGB(255, 183, 147, 95);
  // static const Color darktextcolor = Color.fromARGB(255, 183, 147, 95);
  // static const Color lighttextcolor = Color.fromARGB(255, 183, 147, 95);

  static const Color DarkprimaryColor = Color.fromARGB(255, 20, 26, 46);
  static const Color darkAccentColor = Color.fromARGB(255, 250, 204, 29);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedLabelStyle: TextStyle(color: Colors.black),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.black),
        unselectedIconTheme: IconThemeData(color: Colors.white)),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: MyThemeData.primaryColor),
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
        color: Colors.transparent,
        elevation: 0),
    primaryColor: MyThemeData.primaryColor,
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedLabelStyle: TextStyle(color: Colors.black),
        selectedItemColor: darkAccentColor,
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(color: darkAccentColor),
        unselectedIconTheme: IconThemeData(color: Colors.white)),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: MyThemeData.primaryColor),
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
        color: Colors.transparent,
        elevation: 0),
    primaryColor: MyThemeData.DarkprimaryColor,
  );
  // TextTheme: Style(TextStyle),

}
