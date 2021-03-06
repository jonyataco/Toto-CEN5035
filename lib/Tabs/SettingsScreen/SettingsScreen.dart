import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:toto_real/Tabs/SettingsScreen/Widgets/ThemeChanger.dart';
import 'Widgets/PushNotifications.dart';
import 'Widgets/ReportProblemWidget.dart';
import 'Widgets/SendFeedbackWidget.dart';
import 'package:toto_real/Authentication Pages/Services/authentication.dart';
import 'Widgets/ThemeChanger.dart';
import 'dart:async';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key, this.auth, this.logoutCallback}): super(key: key);
  
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  
  @override
  _SettingsScreen createState() => _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  Brightness brightness;
  bool _notificationSelected = false;
  bool _darkSelected = false;
  String text;

  Future<void> signOut() async{
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
    //Navigator.popUntil(context, ModalRoute.withName("/"));
  }

  Future<void> _areYouSure(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Are you sure?'),
        content: const Text('Feeding schedule will be erased.'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('Yes'),
            textColor: Colors.deepOrange,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: const Text('No'),
            textColor: Colors.deepOrange,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );}

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: Text('Push Notifications', style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),),
              subtitle: Text('Allow Toto to send notifications'), 
              value: _notificationSelected,
              activeColor: Colors.deepOrange,
              onChanged: (bool newValue) {
                setState(() {
                   _notificationSelected = newValue;
                });
              },
          ),
          
          Divider(),
          SwitchListTile(
              title: Text('Dark Mode', style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),),
              subtitle: Text('Switch the app display to dark mode'), 
              value: themeChanger.darkSelected,
              activeColor: Colors.deepOrange,
              onChanged: (newValue) {
                setState(() {
                  themeChanger.switchTheme();
                  _darkSelected = newValue;
                });     
            },
          ),
         
          Divider(),
          ListTile(
            title: Text('Clear Schedule', style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),),
            trailing: Icon(Icons.date_range),
            onTap: () {
              _areYouSure(context);
            },
          ),
          
          Divider(),
          ListTile(
            title: Text('Report a Problem', style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ReportProblemPage(auth: widget.auth,)));
            },
          ),
          
          Divider(),
          ListTile(
            title: Text('Send Feedback', style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SendFeedbackPage(auth: widget.auth)));
            },
          ),
        ]
      )
  );}
  
  // @override
  // bool get wantKeepAlive => true;
}







