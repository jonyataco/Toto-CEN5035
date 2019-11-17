import 'package:flutter/material.dart';
import './loginPage.dart';
import '../Services/authentication.dart';
import '../../Tabs/home_page.dart';

/// Type that determines the current authentication status
enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

/// The RootPage that takes in the firebase authentication widget
/// as a constructor. This class is what determines the current log in status of
/// the user. Based on the login status, it will then display either the main 
/// home page or prompt the user to login.
class RootPage extends StatefulWidget {
  RootPage({this.auth});
  
  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}


class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";

  @override
  // Initializes the state
  void initState() {
    super.initState();
    // Gets the user from the authentication widget
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        /* If a user is returned from getCurrentUser, then set authStatus as 
         * LOGGED_IN
         */
        if (user != null) {
          _userId = user?.uid;
          authStatus = AuthStatus.LOGGED_IN;
        }
        else {
          authStatus = AuthStatus.NOT_LOGGED_IN;
        }
      });
    });
  }

  void loginCallback() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }

  void logoutCallback() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = "";
    });
  }

  Widget buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return buildWaitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return LoginPage(
          auth: widget.auth,
          loginCallback: loginCallback,
        );
        break;
      case AuthStatus.LOGGED_IN:
        if (_userId.length > 0 && _userId != null) {
          return StatefulTabController(
            userId: _userId,
            auth: widget.auth,
            logoutCallback: logoutCallback,
          );
        } else
          return buildWaitingScreen();
        break;
      default:
        return buildWaitingScreen();
    }
  }
}
