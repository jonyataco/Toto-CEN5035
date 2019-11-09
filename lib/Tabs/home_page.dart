import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Tabs/PawScreen/PawScreen.dart';
import '../Tabs/PawScreen/Models/levelModel.dart';
import '../Tabs/SettingsScreen/SettingsScreen.dart';
import '../Tabs/VideoChatScreen/VideochatScreen.dart';
import '../Tabs/NotificationScreen/NotificationScreen.dart';
import '../Tabs/AccountScreen/AccountScreen.dart';
import '../Services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';


void main() => runApp(MyApp());

/// The root of the application. When the build function is called, it builds
/// the StatefulTabController.
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: StatefulTabController(),
    );
  }
}

/// StatefulTabController that builds _StatefulTabControllerState
class StatefulTabController extends StatefulWidget {
 // StatefulTabController({Key key}) : super(key: key);
StatefulTabController({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);
      
final BaseAuth auth;
final VoidCallback logoutCallback;
final String userId;

  @override
  _StatefulTabControllerState createState() => _StatefulTabControllerState();
}

/// Class that can be considered homebase for the application after logging in.
/// Implements the building and logic of switching between the different tabs
/// of the application.
class _StatefulTabControllerState extends State<StatefulTabController> {
  // On initial load of the application the app will index automatically to 2, the PawScreen
  int _currentIndex = 2;

  // List of widgetOptions
  List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Settings'),
    Text('Index 1: Video Chat'),
    PawScreen(),
    NotificationScreen(),
    Text('Index 4: Account'),
  ];

  // List of appBar Titles that will change depending on the tab selected
  List<String> _appBarOptions = <String> [
    'Settings',
    'Video Chat',
    'Toto',
    'Notifications',
    'Account'
  ];
  
  // Function that will change the current index
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  //Temporary log out,,, the logout button should be in the account or settings page. 
  //when that pages gets build, it will contain a logout
  //temporary log out
  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  // The build function will build the current screen based on the tab that is 
  // selected
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => LevelModel(),
      child: Scaffold(
        appBar: AppBar( 
          title: new Text(_appBarOptions.elementAt(_currentIndex),
            textAlign: TextAlign.center,
            style: TextStyle(
            fontSize: 30,
            color: Colors.pink[800],
            )
          ),

  //Temporary log out,,, the logout button should be in the account or settings page. 
  //when that pages gets build, it will contain a logout
  //temporary log out
          actions: <Widget>[
              new FlatButton(
          child: new Text('Logout',
                style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
            ],
        
        ),
        body: _widgetOptions.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('settings'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_call),
              title: Text('chat'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pets),
              title: Text('status')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Notifications'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Account')
            )
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
