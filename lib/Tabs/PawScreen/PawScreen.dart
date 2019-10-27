import 'package:flutter/widgets.dart';

class PawScreen extends StatefulWidget {
  PawScreen({Key key}) : super(key : key);

  @override
  _PawScreenState createState() => _PawScreenState();
}

class _PawScreenState extends State<PawScreen> {
  int foodLevel;
  int waterLevel;

  @override
  Widget build(BuildContext context) {
    return (
      Center (
        child: Text('The current water level is 300'),
      )
    );
  }
}