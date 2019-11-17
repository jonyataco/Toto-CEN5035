import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toto_real/Tabs/AccountScreen/Widgets/camera.dart';
import 'package:toto_real/Tabs/AccountScreen/Widgets/profile_pic.dart';
import '../AccountScreen/Services/accountService.dart';
import './Models/account_model.dart';
import './Widgets/user_info.dart';

class AccountScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<AccountModel>(
      builder: (context, account, _) =>
      Column(
        children: <Widget>[
          ProfilePic(),
          Camera(),
          Expanded(
            flex: 2,
            child: UserInfo('First Name', account.firstName, Colors.blue)
          ),
          Expanded(
            flex: 2,
            child: UserInfo('Last Name', account.lastName, Colors.pink)
          ),
          Expanded(
            flex: 2,
            child: UserInfo('Email', account.email, Colors.yellow)
          ),
          Expanded(
            flex: 2,
            child: UserInfo('Pet Name', account.petName + ' 🐶', Colors.indigo)
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: SizedBox(
                height: 10,
                width: 150,
                child: RaisedButton(
                  onPressed: null,
                  child: Text(
                    'Reset password'
                  )
                )
              ),
            )
          ),
        ]
      ),
    );
  }
}