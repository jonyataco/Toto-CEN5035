import 'package:flutter/material.dart';
import './Widgets/TotoAppBar.dart';
import 'package:toto_real/Services/authentication.dart';

class SignupPage extends StatefulWidget {
  SignupPage({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  State<StatefulWidget> createState() => new _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  String _first_name;
  String _last_name;
  String _pet_name;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TotoAppBar('Create an account'),
    );
  }
}

