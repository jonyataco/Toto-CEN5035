import 'package:flutter/material.dart';

class TotoAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String titleText;
  TotoAppBar(this.titleText);

  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        titleText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
          color: Colors.pink[800]
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => null;
}