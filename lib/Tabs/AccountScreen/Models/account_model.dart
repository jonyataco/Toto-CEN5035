import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import './user_account.dart';

/// Class that implements the logic behind the account model.
/// Takes in a userID (String) which is then used to query a database.
class AccountModel with ChangeNotifier {
  final String userID;
  DatabaseReference dbRef;
  StorageReference storageRef;
  UserAccount account;
  AccountModel(this.userID) {
    dbRef = FirebaseDatabase.instance.reference();
    storageRef = FirebaseStorage.instance.ref();
    dbRef.child('users/' + userID).once().then((DataSnapshot data) {
      account = new UserAccount.fromJson(data.value);
    });
  }

  String get firstName {
    return account.firstName;
  } 

  String get lastName {
    return account.lastName;
  }

  String get petName {
    return account.petName;
  }

  String get email {
    return account.email;
  }
  
  String get photoURL {
    return account.photoURL;
  }

 set photoURL(value) {
    dbRef.child('users/' + userID).update({
      'photoURL' : value
    }).then((dummyValue) {
      if (account.photoURL != '') {
        storageRef.child(account.photoURL).delete().then((superDumValue) {
          account.photoURL = value;
          notifyListeners(); 
        });
      }
      else {
        account.photoURL = value;
        notifyListeners();
      }
    });
  }
}
