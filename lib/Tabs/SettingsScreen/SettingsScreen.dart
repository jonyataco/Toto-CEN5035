import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:toto_real/Tabs/SettingsScreen/Widgets/ThemeChanger.dart';
import 'Widgets/PushNotifications.dart';
import 'Widgets/ReportProblemWidget.dart';
import 'Widgets/SendFeedbackWidget.dart';
import 'package:toto_real/Authentication Pages/Services/authentication.dart';
import 'Widgets/ThemeChanger.dart';


class SettingsScreen extends StatefulWidget {
  SettingsScreen({this.auth, this.logoutCallback});
  
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

  signOut() async{
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
      } 
    catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
      final themeChanger = Provider.of<ThemeChanger>(context);
      return Scaffold(
        body: ListView(
          children: <Widget>[
            SwitchListTile(
              title: Text('Push Notifications', style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),),
                subtitle: Text('Allow Toto to send notifications'), 
                  value: themeChanger.notificationSelected,
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
              onChanged: (newValue) {
                setState(() {
                  themeChanger.switchTheme();
                  _darkSelected = newValue;
                });     
            },
          ),
          Divider(),
          ListTile(
            title: Text('Report a Problem', style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.5),),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){
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
          Divider(),
          Container(
            padding: EdgeInsets.only(right: 50, left: 50, top: 50),
            child: RaisedButton(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
            ),
            color: Colors.cyan,
            child: Text('Logout',
              style: TextStyle(fontSize: 23.0, color: Colors.white)),
              onPressed: signOut,
          ),
          )
          ]            
      )       
    );            
  }

  @override
  bool get wantKeepAlive => true;
}


//(_darkSelected = true)?DynamicTheme.of(context).setBrightness(Brightness.dark):DynamicTheme.of(context).setBrightness(Brightness.dark);




