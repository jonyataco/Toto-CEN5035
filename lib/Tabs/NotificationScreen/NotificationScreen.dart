import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Widgets/TotoNotificationWidget.dart';


/// Class that builds _NotificationScreenState
class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key key}) : super(key : key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

/// Class that builds the NotificationScreenBased on the current state
/// This screen is stateful because it should read notifications from firebase,
/// we have to design how notifications look inside the databse.
class _NotificationScreenState extends State<NotificationScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<TotoNotification> notificationList = List<TotoNotification>();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    for (int i = 0; i < 20; i++) {
      if(i==0) {
        notificationList.add(
        TotoNotification('Check Food', 'Food container running low.', Icon(Icons.priority_high, size: 40.0)));
      }
      if (i== 3){
        notificationList.add(
        TotoNotification('Check Water', 'Water container is running low.', Icon(Icons.priority_high, size: 40.0)));
      }
      if (i%2 == 0) {
      notificationList.add(
        TotoNotification('Your pet has been fed', 'Feeding was performed at 4 pm.', Icon(Icons.video_call, size: 40.0)));
      } 
       else{
          notificationList.add(
        TotoNotification('You pet is nearby', 'Open video chat to see.', Icon(Icons.check, size: 40.0)));
        }
    }

    return (
      ListView(
        /* The key stores the page in memory and keeps the scroll position even
         * even when navigating back and forth between tabs
         */
        key: PageStorageKey<String>('Notifications'),
        children: notificationList
      )
    );
  }
}
