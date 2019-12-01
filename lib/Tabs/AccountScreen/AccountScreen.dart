import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toto_real/Tabs/AccountScreen/Widgets/camera.dart';
import 'package:toto_real/Tabs/AccountScreen/Widgets/profile_pic.dart';
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
            child: UserInfo('First Name', account.firstName, /*Colors.blue*/)
          ),
          Expanded(
            flex: 2,
            child: UserInfo('Last Name', account.lastName, /*Colors.pink*/)
          ),
          Expanded(
            flex: 2,
            child: UserInfo('Email', account.email, /*Colors.yellow*/)
          ),
          Expanded(
            flex: 2,
            child: UserInfo('Pet Name', account.petName + ' 🐶', /*Colors.indigo*/)
          ),
          Container(
            padding: EdgeInsets.only(right: 50, left: 50, top: 25, bottom: 15),
            child: RaisedButton(
              disabledColor: Colors.cyan,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)
              ),
              color: Colors.cyan,
              child: Text('Reset Password',
                style: TextStyle(fontSize: 16.0, color: Colors.deepOrange)),
              onPressed: null,
           ),
          )
        ]
      ),
    );
  }
}