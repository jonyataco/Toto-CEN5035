import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toto_real/Tabs/SettingsScreen/Widgets/ThemeChanger.dart';

class TotoAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String titleText;
  TotoAppBar(this.titleText);

  Widget build(BuildContext context) {
    //final themeChanger = Provider.of<ThemeChanger>(context);
    return AppBar(
      backgroundColor: Colors.cyan,
      centerTitle: true,
      title: Text(
        titleText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 28,
          color: Colors.deepOrange
        ),
      ),
    );
  }

  @override
  // Sets the size of the AppBar
  Size get preferredSize => Size.fromHeight(60);
}