import 'package:flutter/material.dart';
import 'package:newsapp/api/ApiManager.dart';
import 'package:newsapp/home/news/sourcesTab.dart';

import '../api/model/Sourcersreponse.dart';
import '../drawer_content.dart';
import '../settings/settings_fragment.dart';
import 'categories/categories_fragment.dart';
import 'news/news_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    currentWidget = CategoriesFragment(onCategoryItemClick);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        drawer: Drawer(
          child: DrawerContent(onSideMenuItemClick),
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              )
          ),
          title: Text('Route news App'),
        ),
        body: currentWidget,
      ),
    );
  }

  late Widget currentWidget ;

  void onCategoryItemClick(Category category){
    currentWidget = NewsFragment(category);
    setState(() {});
  }
  void onSideMenuItemClick(int type){
    if(type==DrawerContent.SETTINGS){
      currentWidget = SettingsFragment();
    }else if(type==DrawerContent.CATEGORIES){
      currentWidget=CategoriesFragment(onCategoryItemClick);
    }
    Navigator.pop(context);
    setState(() {});
  }
}
