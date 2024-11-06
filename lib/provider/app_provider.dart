import 'package:flutter/material.dart' ;
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
 bool isArEnable=false;
 bool isDarkThemeEnable=false;
changeCurrantLocala(bool newValue) async{
savelang(newValue);
   isArEnable=newValue;
  notifyListeners();
  savelang(newValue);

}
changeCurrantTheme(bool newValue) async{
   savetheme(newValue);
    isDarkThemeEnable =  newValue;
  notifyListeners(); 
  savetheme(newValue);

}
savelang(bool newValue)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("lang", true);
}
savetheme(bool newValue)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setBool("theme", true);
}
getlang()async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   isArEnable = prefs.getBool("lang")!;
}
gettheme()async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   isDarkThemeEnable=prefs.getBool("theme")!;

}
}