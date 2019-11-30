import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toto_real/Tabs/PawScreen/Models/userid_model.dart';

class DispenseFood extends StatelessWidget {
  final String title = "Dispense Food";
  final String details = "The next dispensement will be at (TIME)";

  @override
  Widget build(BuildContext context) {
    final userID = Provider.of<UserIDModel>(context);
    DatabaseReference dbRef = FirebaseDatabase.instance.reference();
    void dispense() {
      dbRef.child('levels/' + userID.uID).update({'foodDispensing': true});
    }

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .10,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Container(
              padding: EdgeInsets.only(top: 18, left: 10),
              child: Column(
                // The alignment for items in the column
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24,
                    )
                  ),
                  Text(
                    details,
                    style: TextStyle(fontSize: 15, color: Colors.grey)
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(left: 15),
              child: IconButton(
                icon: Icon(Icons.pets),
                iconSize: 40,
                color: Colors.deepOrange,
                onPressed: dispense,
              ),
            ),
          ),
        ],
      ),
    );
  }
}