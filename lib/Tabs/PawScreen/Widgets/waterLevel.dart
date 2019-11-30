import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../Models/levelModel.dart';
import 'package:toto_real/Tabs/PawScreen/Widgets/totoLevels.dart';

class WaterLevel extends StatelessWidget {
  final String userID;
  WaterLevel({this.userID});
  @override
  Widget build(BuildContext context) {
    return Consumer<LevelModel> (
      builder: (context, level, _) =>
      Expanded(
        flex: 1,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Container(
                child: Center(child: TotoLevel(
                  375, 
                  130, 
                  Colors.blue, 
                  level.waterLevel,
                  level.waterBorder)
                ),
              )
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'Water Level: ${(level.waterLevel/375 * 100).round()}%',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ),
          ],
        )
      )
    );
  }
}