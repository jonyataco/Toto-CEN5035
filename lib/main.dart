import 'package:flutter/material.dart';
import './Services/authentication.dart';
import './Authentication Pages/root_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Toto',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: new RootPage(auth: new Auth()));
  }
}
