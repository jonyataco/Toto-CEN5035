import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:toto_real/Tabs/PawScreen/Widgets/totoLevels.dart';

class FoodLevel extends StatelessWidget {
  final String userID;
  FoodLevel({this.userID});
  @override
  Widget build(BuildContext context) {
      DatabaseReference dbRef = FirebaseDatabase.instance.reference();
      return StreamBuilder<Event>(
        stream: dbRef.child('levels/' + userID + '/foodLevel').onValue,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: Container(
                      child: Center(child: TotoLevel(
                        375, 
                        130, 
                        Colors.brown, 
                        0,
                        Colors.black)
                      ),
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        ' Level: 0%',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ),
                ],
              )
            );
        }
        else {
          Color warning;
          if (snapshot.data.snapshot.value < 30) {
            warning = Colors.red;
          }
          else if (snapshot.data.snapshot.value >= 30 && snapshot.data.snapshot.value <= 50) {
            warning = Colors.yellow;
          }
          else {
            warning = Colors.green;
          }

          int value = snapshot.data.snapshot.value;
          if (snapshot.data.snapshot.value < 0) {
            value = 0;
          }

          return Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: Container(
                    child: Center(child: TotoLevel(
                      375, 
                      130, 
                      Colors.brown, 
                      (value * 372/100),
                      warning)
                    ),
                  )
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'Food Level: ${value}%',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ),
              ],
            )
          );
        }
     }
    );
  }
}