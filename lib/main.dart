import 'package:flutter/material.dart';
import './Authentication Pages/Services/authentication.dart';
import './Authentication Pages/Views/root_page.dart';

/// Runs the application
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Toto',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: RootPage(auth: Auth()));
  }
}
