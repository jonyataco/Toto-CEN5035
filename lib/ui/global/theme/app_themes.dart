import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


enum AppTheme{
  cyanLight,
  cyanDark,
}

final appThemeData = {
  AppTheme.cyanLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.cyan,
  ),

  AppTheme.cyanDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.cyan,
  ),
};
