import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/levelModel.dart';

class DispenseWater extends StatelessWidget {
  final String title = "Dispense Water";
  final String details = "The next dispensement will be at (TIME)";

  @override
  Widget build(BuildContext context) {
    final level = Provider.of<LevelModel>(context);
    return Container(
      //width: double.infinity,
      //height: MediaQuery.of(context).size.height * .10,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.only(top: 15, left: 10, bottom: 10),
              child: Column(
                // The alignment for items in the column
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                    )
                  ),
                  Text(
                    details,
                    style: TextStyle(fontSize: 13, color: Colors.grey)
                  )
                ],
              ),
            ),
          ), Divider(),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 15),
              child: IconButton(
                icon: Icon(Icons.pets),
                iconSize: 40,
                color: Colors.deepOrange,
                onPressed: () => {level.waterLevel = level.waterLevel - 10}
              ),
            ),
          ),
        ],
      ),
    );
  }
}