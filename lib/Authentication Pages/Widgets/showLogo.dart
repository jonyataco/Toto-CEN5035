import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShowLogo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 90.0,
          child: Image.asset('assets/logo-v2.png')
        ),
      ),
    );
  }
}