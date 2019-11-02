import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Schedule extends StatelessWidget {
  final String _scheduleDetails;
  final String _scheduleButtonText;

  Schedule(this._scheduleDetails,this._scheduleButtonText);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Center(
              child: Text(
                'Your next feeding time is (FEEDING TIME)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          )
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(right: 30),
            child: RaisedButton(
              onPressed: () => {print('Editing the schedule')},
              child: Text(
                'Edit schedule',
              )
            )
          )
        )
      ],
    );
  }
}