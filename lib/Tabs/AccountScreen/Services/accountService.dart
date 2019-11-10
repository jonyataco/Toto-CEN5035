import 'package:firebase_database/firebase_database.dart';

abstract class BaseAccount {
  String getAccountInfo();
}

class Account implements BaseAccount {
  String getAccountInfo() {
    final DatabaseReference _dbref = FirebaseDatabase.instance.reference();
    _dbref.once().then((DataSnapshot data) {
      print(data.value);
      return "";
    });
  }
}