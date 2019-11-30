import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserIDModel with ChangeNotifier {
  final String userID;
  UserIDModel(this.userID);

  String get uID => userID;
}