import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:toto_real/Tabs/PawScreen/Widgets/dispenseFood.dart';
import 'package:toto_real/Tabs/PawScreen/Widgets/dispenseWater.dart';
import 'package:toto_real/Tabs/PawScreen/Widgets/foodLevel.dart';
import 'package:toto_real/Tabs/PawScreen/Widgets/waterLevel.dart';
import '../../Services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../Models/todo.dart';
import 'Widgets/totoLevels.dart';
import 'Widgets/scheduleWidget.dart';

class PawScreen extends StatefulWidget {
  PawScreen({Key key}) : super(key : key);

  @override
  _PawScreenState createState() => _PawScreenState();
}

class _PawScreenState extends State<PawScreen> {
  // Need to grab these levels from firebase
  int foodLevel;
  int waterLevel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DispenseFood(),
        DispenseWater(),
        Expanded(
          flex: 5,
          child: Container(
            child: Row(
              children: <Widget>[
                WaterLevel(), 
                FoodLevel(),
              ],
            )
          ),
        ),
        Expanded(
          flex: 1,
          child: Schedule('test','testing'),
        )
      ],
    );
  }
}
