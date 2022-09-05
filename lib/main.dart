import 'package:flutter/material.dart';
import 'package:newsapp/home/HomeScreen.dart';
import 'package:newsapp/news_detail_screen.dart';

import 'MyTheme.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_)=> HomeScreen(),
        news_details_screen.routeName : (_) => news_details_screen()
      },
      initialRoute: HomeScreen.routeName,
      theme: MyThemes.lightTheme,

    );
  }
}

