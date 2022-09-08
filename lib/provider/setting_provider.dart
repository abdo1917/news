import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class setting_providers extends ChangeNotifier {
  String current_language = 'en';


  void changeLanguage (String NewLang) async{
    final prefs = await SharedPreferences.getInstance();

    if(NewLang==current_language){
      return ;
    }
    current_language= NewLang;
    prefs.setString('lang', current_language);
    notifyListeners();
  }


  bool IsEn(){
    return current_language=='en';
  }


}
