import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:toto_real/Tabs/PawScreen/Models/userid_model.dart';
import 'package:toto_real/Tabs/PawScreen/Widgets/dispenseFood.dart';
import 'package:toto_real/Tabs/PawScreen/Widgets/dispenseWater.dart';
import 'package:toto_real/Tabs/PawScreen/Widgets/foodLevel.dart';
import 'package:toto_real/Tabs/PawScreen/Widgets/waterLevel.dart';
import 'Widgets/scheduleWidget.dart';

class PawScreen extends StatelessWidget {
  final String userID;
  PawScreen({this.userID});
  @override
  Widget build(BuildContext context) {
    var userIDModel = Provider.of<UserIDModel>(context);
    return Column(
      //MainAxisAlignment.center,
      children: <Widget>[
        DispenseFood(),
        DispenseWater(),
        Expanded(
          flex: 5,
          child: Container(
            child: Row(
              children: <Widget>[
                WaterLevel(userID: userIDModel.userID),
                FoodLevel(userID: userIDModel.userID),
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

