import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  getTheme() => _themeData; //Gets the theme

  setTheme(ThemeData selectedtheme) {
    //Sets the theme
    _themeData = selectedtheme;
    notifyListeners();
  }
}