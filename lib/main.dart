import 'package:flutter/material.dart';
import './Services/authentication.dart';
import './Authentication Pages/root_page.dart';

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
