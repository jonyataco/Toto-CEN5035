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
    Icon testIcon = Icon(Icons.opacity);
    for (int i = 0; i < 20; i++) {
      notificationList.add(
        TotoNotification('Test $i', 'Details for test blah blah blah blah blah $i', testIcon));
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
