import 'package:flutter/material.dart';

// class MyThemes{
//   const final Color primarylight = Color(0xFF39A552);
// const final ThemeData lightTheme = ThemeData(
//   primaryColor: primarylight,
//   appBarTheme: AppBarTheme(
//     backgroundColor: Color(0xFF39A552),
//     elevation: 0,
//     titleTextStyle: TextStyle(
//       color: Colors.white,
//       fontSize: 30,
//     ),
//
//   ),
//   textTheme: TextTheme(
//       bodyText1: TextStyle(fontSize: 18, color: Colors.black),
//       headline4: TextStyle(fontSize: 28, color: Colors.black),
//       headline5: TextStyle(fontSize: 24, color: Colors.black)
//   ),
//
// );}

class MyThemes{
static final Color primaryColor = Color(0xFF39A552);


static final ThemeData lightTheme = ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 30,
      ),
      iconTheme: IconThemeData(
          color: Colors.white
      )
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(fontSize: 18, color: Colors.black),
      headline4: TextStyle(fontSize: 28, color: Colors.black),
      headline5: TextStyle(fontSize: 24, color: Colors.white)
  ),

);


}