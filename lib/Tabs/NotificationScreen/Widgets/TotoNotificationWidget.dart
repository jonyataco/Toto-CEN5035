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
    // Building a container for the notification that defines height and width.
    return Container(
      width: double.infinity,
      height: 70,
      // Definining Border of the container
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.0, color: Colors.black26)),
      ),
      /* The child of the container will be a row. Inside of the row,
       * there are two expandeds. Inside of the right expanded there is an icon.
       * Inside of the left expanded, there are two rows and the top row
       * is used for the notificationTitle and the bottom row is used for
       * notification details.
       */
      child: Row(
        children: <Widget>[ 
          Expanded(
            flex: 9, 
            child: Container(
              padding: EdgeInsets.all(8),
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
            flex: 2,
            child: Container(
              child: notificationIcon,
            ),
          ),
        ],
      ),
    );
  }
}