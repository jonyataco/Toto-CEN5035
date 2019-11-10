import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AccountModel with ChangeNotifier {
  // Creating a reference to the database
  final dbRef = FirebaseDatabase.instance.reference();

  // Constructor which takes in the userID

}