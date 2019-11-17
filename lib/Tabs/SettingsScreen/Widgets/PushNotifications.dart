import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// class PushNotifications extends StatefulWidget {
//   PushNotifications({Key key}) : super(key: key);

//   @override
//   _PushNotificationsState createState() => _PushNotificationsState();
// }

// class PushNotifications extends StatefulWidget {
//   bool _notificationSelected = false;
  
//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       SwitchListTile(
//       title: Text('Push Notifications'),
//       subtitle: Text('Allow Toto to send notifications'), 
//       value: _notificationSelected,
//       onChanged: (bool value) {
//         setState(() {
//           _notificationSelected = value;
//         }
//           );
//              },
//     ), 
//     );
//   }
// }

class PushNotifications extends StatefulWidget {
  @override
  _PushNotificationsState createState() => _PushNotificationsState();
}

class _PushNotificationsState extends State<PushNotifications> {
  final String title = "Push Notifications";
  final String details = "Allow Toto to send notifications";

  bool _notificationSelected = false;

  @override
  Widget build(BuildContext context) {
    
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
              child: SwitchListTile(
                value: _notificationSelected,
                onChanged: (bool value) {
        
           _notificationSelected = value;
      }
              ),
            ),
          ),
        ],
      ),
    );
  }
}





  

