import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toto_real/Tabs/PawScreen/Widgets/dispenseFood.dart';
import 'package:toto_real/Tabs/PawScreen/Widgets/dispenseWater.dart';
import 'package:toto_real/Tabs/PawScreen/Widgets/foodLevel.dart';
import 'package:toto_real/Tabs/PawScreen/Widgets/waterLevel.dart';
import 'Widgets/scheduleWidget.dart';

class PawScreen extends StatelessWidget {
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
