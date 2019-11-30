import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String userField;
  final String userValue;
  //final Color containerColor;
  UserInfo(this.userField, this.userValue, /*this.containerColor*/);

  Widget build(BuildContext context) {
    return Container (
      //color: containerColor,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black26,
            width: .5
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text(
                userField,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold
                )
              )
            )
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Text(
                userValue,
                style: TextStyle(
                  fontSize: 20,
                )
              )
            )
          ),
        ],
      )
    );
  }
}