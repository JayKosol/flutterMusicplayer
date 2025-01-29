import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuctest/themes/darkmode.dart';
import 'package:fuctest/themes/lightmode.dart';

class ThemesProvider extends ChangeNotifier{
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
  void toggleTheme(){
    if(_themeData == lightMode){
      themeData = darkMode;
    }
    else{
      themeData = lightMode;
    }
  }
}