import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  bool _notificationSelected;
  bool _darkSelected;
  SharedPreferences _prefs;
  static const String _themeField = 'theme';
  static const int _lightThemeInt = 0;
  static const int _darkThemeInt = 1;

  final _lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.cyan,
    accentColor: Colors.deepOrange,
    canvasColor: Colors.cyan,
    primaryIconTheme: IconThemeData(color: Colors.black),
  );

  final _darkTheme = ThemeData.dark().copyWith(
    //primaryColor: Colors.black54,
    accentColor: Colors.deepOrange,
    canvasColor: Colors.grey[900],
    primaryIconTheme: IconThemeData(color: Colors.white),
  ); 

  ThemeChanger() {
    _notificationSelected = false;
    _darkSelected = false;
    _themeData = _lightTheme;
    asyncInit();
  }

  Future<void> asyncInit() async {
    _prefs = await SharedPreferences.getInstance();
    int theme = (_prefs.getInt(_themeField) ?? 0);
    if (theme == _lightThemeInt) {
      _themeData = _lightTheme;
    } else {
      _themeData = _darkTheme;
    }
    notifyListeners();
  }

  ThemeData get theme => _themeData;
  bool get notificationSelected => _notificationSelected;
  bool get darkSelected => _darkSelected;

  void switchTheme() {
    if (_themeData == _lightTheme) {
      _themeData = _darkTheme;
      _darkSelected = true;
      _prefs.setInt(_themeField, _darkThemeInt);
    } 
    else {
      _themeData = _lightTheme;
      _darkSelected = false;
      _prefs.setInt(_themeField, _lightThemeInt);
    }
    notifyListeners();
  }
}