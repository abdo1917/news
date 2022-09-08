import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newsapp/home/HomeScreen.dart';
import 'package:newsapp/news_detail_screen.dart';
import 'package:newsapp/provider/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MyTheme.dart';

void main() {
  runApp( ChangeNotifierProvider<setting_providers>(
      create: (buildcontext){return setting_providers();},child: MyApp()));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    late setting_providers settingProvider;
    settingProvider = Provider.of<setting_providers>(context);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingProvider.current_language),
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

