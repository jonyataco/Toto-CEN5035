import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toto_real/Tabs/PawScreen/Models/userid_model.dart';
import '../Tabs/PawScreen/PawScreen.dart';
import '../Tabs/PawScreen/Models/userid_model.dart';
import '../Tabs/PawScreen/Models/levelModel.dart';
import '../Tabs/SettingsScreen/SettingsScreen.dart';
import '../Tabs/VideoChatScreen/VideochatScreen.dart';
import '../Tabs/NotificationScreen/NotificationScreen.dart';
import '../Tabs/AccountScreen/AccountScreen.dart';
import '../Tabs/AccountScreen/Models/account_model.dart';
import '../Authentication Pages/Services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import '../Tabs/VideoChatScreen/VideochatScreen.dart';
import 'SettingsScreen/Widgets/ThemeChanger.dart';


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
    SettingsScreen(),
    VideoScreen(),
    PawScreen(),
    NotificationScreen(),
    AccountScreen(),
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
    final themeChanger = Provider.of<ThemeChanger>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => LevelModel()
        ),
        ChangeNotifierProvider(
          builder: (context) => UserIDModel(widget.userId)
        ),
        ChangeNotifierProvider(
          builder: (conext) => AccountModel(widget.userId)
        ),
      ],
      child: Scaffold(
        appBar: AppBar( 
          title: new Text(_appBarOptions.elementAt(_currentIndex),
            textAlign: TextAlign.center,
            style: TextStyle(
            fontSize: 30,
            color: Colors.deepOrange,
            )
          ),
          
  //Temporary log out,,, the logout button should be in the account or settings page. 
  //when that pages gets build, it will contain a logout
  //temporary log out
          actions: <Widget>[
              new FlatButton(
          child: new Text('Logout',
                style: new TextStyle(fontSize: 17.0, color: Colors.blueGrey)),
                onPressed: signOut)
            ],
        ),
        body: _widgetOptions.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_call),
              title: Text('Video'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pets),
              title: Text('Status')
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
          selectedItemColor: Colors.deepOrange,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
