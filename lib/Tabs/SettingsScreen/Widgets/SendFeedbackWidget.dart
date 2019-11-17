import 'package:flutter/material.dart';
import 'package:toto_real/Services/authentication.dart';
import '../../../Authentication Pages/Widgets/TotoAppBar.dart';
import '../SettingsScreen.dart';

class SendFeedbackPage extends StatefulWidget {
  SendFeedbackPage({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  State<StatefulWidget> createState() => new _SendFeedbackPage();
}

 Widget titleMessage() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 30.0, 0.0),
      
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: InputDecoration(
          
          hintText: 'Title',
          ),
        ),
      );
  }

   Widget message() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 30.0, 0.0),
      child: TextFormField(
        maxLines: 15,
        keyboardType: TextInputType.multiline,
        autofocus: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Message',
          ),
        ),
      );
  }

  Widget send(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 45.0, 30.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: RaisedButton(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          color: Colors.cyan,
          child: Text(
            'Send',
            style: TextStyle(
              fontSize: 20.0, 
              color: Colors.white
            )
          ),
          onPressed: (){
            var widget;
             Navigator.pop(context, MaterialPageRoute(builder: (context) => SettingsScreen(auth: widget.auth,)));
          },
        ),
      ),
    );
  }
  

class _SendFeedbackPage extends State<SendFeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TotoAppBar ('Send Feedback'),
      body: Stack(
       children: <Widget>[
          Container(
            height: 800,
            width: 600,
            child: Align(
              child: Form(
                child: ListView( 
                  shrinkWrap: true,
                  children: <Widget>[
                    titleMessage(),
                    message(),
                    send(context),
                  ]
                )
              )
            )
          )
       

        ],
        
      )
      );
  }

}