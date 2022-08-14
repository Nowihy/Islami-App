import 'package:flutter/material.dart';

class MyTheme {
  static final Color darkPrimaryColor = Color(0xFFFACC1D);
  static final Color lightPrimaryColor = Color(0xFFB7935F);
  static final Color colorDarkBlue = Color(0xFF141A2E);
  static final ThemeData lightTheme = ThemeData(
      backgroundColor: Colors.white,
      primaryColor: lightPrimaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
      textTheme: TextTheme(
          headline4: TextStyle(fontSize: 28, color: Colors.black),
          headline5: TextStyle(fontSize: 25, color: Colors.black),
          bodyText1: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          bodyText2: TextStyle(fontSize: 20, color: Colors.black)),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: lightPrimaryColor,
          selectedIconTheme: IconThemeData(color: Colors.black),
          unselectedIconTheme: IconThemeData(color: Colors.white),
          selectedLabelStyle: TextStyle(color: Colors.black),
          selectedItemColor: Colors.black));
  static final ThemeData darkTheme = ThemeData(
      backgroundColor: colorDarkBlue,
      primaryColor: darkPrimaryColor,
      scaffoldBackgroundColor: Colors.transparent,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: colorDarkBlue),
      textTheme: TextTheme(
          headline4: TextStyle(fontSize: 28, color: Colors.white),
          headline5: TextStyle(fontSize: 25, color: Colors.white),
          bodyText1: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          bodyText2: TextStyle(fontSize: 20, color: Colors.white)),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: darkPrimaryColor,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: colorDarkBlue,
          selectedIconTheme: IconThemeData(color: darkPrimaryColor),
          unselectedIconTheme: IconThemeData(color: Colors.white),
          selectedLabelStyle: TextStyle(color: darkPrimaryColor),
          selectedItemColor: Colors.white));
}
