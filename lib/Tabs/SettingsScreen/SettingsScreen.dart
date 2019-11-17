
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:package_info/package_info.dart';
import 'package:toto_real/ui/global/theme/app_themes.dart';
import 'package:toto_real/ui/global/theme/bloc/bloc.dart';
import 'Widgets/DarkModeWidget.dart';
import 'Widgets/PushNotifications.dart';
import 'Widgets/ReportProblemWidget.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'Widgets/SendFeedbackWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toto_real/Services/authentication.dart';



class SettingsScreen extends StatefulWidget {
  SettingsScreen({this.auth, this.logoutCallback});
  
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  
  @override
  _SettingsScreen createState() => _SettingsScreen();

}

class _SettingsScreen extends State<SettingsScreen>{
  
  Brightness brightness;
  bool _notificationSelected = false;
  bool _darkSelected = false;
  bool _lightSelected = true;
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
          
                    return new Scaffold(
                       
                      body: ListView(
                        children: <Widget>[
                          SwitchListTile(
                            title: Text('Push Notifications'),
                            subtitle: Text('Allow Toto to send notifications'), 
                            value: _notificationSelected,
                            onChanged: (bool newValue) {
                               setState(() {
                                _notificationSelected = newValue;
                              });
                            },
                          ),
                      Divider(),
      //                 ListTile(
      //                   text = 'Light Mode',
      //               title: Text(text),
      //   trailing: Icon(Icons.brightness_5),
        
      //   onTap: (){
          
      //     (_darkSelected = true)?DynamicTheme.of(context).setBrightness(Brightness.dark):DynamicTheme.of(context).setBrightness(Brightness.dark);
      //     Text('Dark Mode');
      //     Icon(Icons.brightness_3);
      //   },
      // ),
            SwitchListTile(
              title: Text('Dark Mode'),
              subtitle: Text('Switch the app display to dark mode'), 
              value: _darkSelected,
              onChanged: (bool newValue) {
              setState(() {
                 (_darkSelected = true)?DynamicTheme.of(context).setBrightness(Brightness.dark):DynamicTheme.of(context).setBrightness(Brightness.light);
                _darkSelected = newValue;
                
              });
            },
            
          ),
      Divider(),
      ListTile(
        title: Text('Report a Problem'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ReportProblemPage(auth: widget.auth,)));
        },
      ),
      Divider(),
      ListTile(
        title: Text('Send Feedback'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SendFeedbackPage(auth: widget.auth)));
        },
                ),
                Divider(),
                FlatButton(
          child: new Text('Logout',
                  style: new TextStyle(fontSize: 17.0, color: Colors.blueGrey)),
                  onPressed: signOut
                    
                  ),

              ] 
                  
             )
            
            );
             
              
        }
}










Widget darkMode() {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: AppTheme.values.length,
        itemBuilder: (context, index) {
          // Enums expose their values as a list - perfect for ListView
          // Store the theme for the current ListView item
          final itemAppTheme = AppTheme.values[index];
          return Card(
            // Style the cards with the to-be-selected theme colors
            color: appThemeData[itemAppTheme].primaryColor,
            child: ListTile(
              title: Text(
                itemAppTheme.toString(),
                // To show light text with the dark variants...
                style: appThemeData[itemAppTheme].textTheme.body1,
              ),
              onTap: () {
                // This will make the Bloc output a new ThemeState,
                // which will rebuild the UI because of the BlocBuilder in main.dart
                BlocProvider.of<ThemeBloc>(context)
                    .dispatch(ThemeChanged(theme: itemAppTheme));
              },
            ),
          );
        },
      ),
    );
  }


 