import 'package:flutter/material.dart';

/// Class that builds a notification.
/// Used by the notification screen which builds a list of notifications to 
/// then render in a scrollable view.
class TotoNotification extends StatelessWidget {
  final String notificationTitle;
  final String notificationDetails;
  final Icon notificationIcon;

  // Constructor for TotoNotification Widget
  TotoNotification(
    this.notificationTitle, 
    this.notificationDetails, 
    this.notificationIcon
  );

  // Widget that will render
  @override
  Widget build(BuildContext context) {
    // Building a sized box that defines that size of each notification rectangle
    return SizedBox(
      width: double.infinity,
      height: 70,
      /* The child of the SizedBox will be a container so we can define a border
       * around the entire notification (in this case we only define bottom border)
       */ 
      child: Container(
        // Definining Border here
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.0, color: Colors.black)),
        ),
        // The child will be a row, and it's children will 
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 9,
              child: Container(
                // Creating padding for the container
                padding: EdgeInsets.all(8),
                /* 
                decoration: BoxDecoration(
                  border: Border.all()
                ),
                */
                child: Column(
                  // The alignment for items in the column
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      notificationTitle,
                      style: TextStyle(
                        fontSize: 24,
                      )
                    ),
                    Text(
                      notificationDetails,
                      style: TextStyle(fontSize: 18, color: Colors.grey)
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Icon(
                  Icons.opacity,
                  size: 40,
                )
              ),
            ),
          ],
        ),
      )
    );
  }
}