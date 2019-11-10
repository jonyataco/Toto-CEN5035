import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../AccountScreen/Services/accountService.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String _currentPicture;
  DatabaseReference _dbRef;

  @override
  void initState() {
    _currentPicture = null;
    _dbRef = FirebaseDatabase.instance.reference();
    super.initState();
  }

  void displayInfo() {
    print('test');
    _dbRef.once().then((DataSnapshot data) {
      print(data.value);
    });
  }

  Widget build(BuildContext context) {
    displayInfo();
    return Column(
      children: <Widget>[
        Text('hello'),
        Text('whatsup')
      ],
    );
  }
}