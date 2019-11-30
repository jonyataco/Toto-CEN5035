import 'package:flutter/material.dart';
import '../Services/authentication.dart';
import '../Widgets/TotoAppBar.dart';
import './create_account.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;
  bool _isLoading;

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    super.initState();
  }

  /// Checks if form is valid before performing login
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  /// Performs login
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });

    // If the form is valid, then proceed with sign in
    if (validateAndSave()) {
      String userId = "";
      userId = await widget.auth.signIn(_email, _password);
      setState(() {
        _isLoading = false;
      });

      // If no userId was returned, then root_page determines next screen
      if (userId.length > 0 && userId != null) {
        _errorMessage = "";
        widget.loginCallback();
      }
      // Else, error message appears
      else {
        _errorMessage = "Incorrect email or password";
      }

      setState(() {
        _formKey.currentState.reset();
      });
    }
    // If the form is not valid, then do not proceed and set _isLoading = false
    else {
      _isLoading = false;
    }
  }

  /// Resets the form
  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TotoAppBar('Toto'),
      body: Stack(
        children: <Widget>[
          _showForm(),
          _showCircularProgress(),
        ],
      )
    );
  }

  /// If it is loading then it shows a circular progress indicator
  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget _showForm() {
    return Container(
      height: 800.0,
      width: 600.0,
      child: Align(
        alignment: Alignment.center,
        child: Center(
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                showLogo(),
                showErrorMessage(),
                showEmailInput(),
                showPasswordInput(),
                showLoginButton(),  
                signInGogle(),
                signInFacebook(),
                showCreateAccountButton(),
              ],
            ),
          ),
        ),
      )
    );
  }

  /// Widget that shows error message
  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return Text(
        _errorMessage,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.red,
          height: 1.0,
          fontWeight: FontWeight.w300
        ),
        textAlign: TextAlign.center,
      );
    } 
    else {
      return Container(
        height: 0.0,
      );
    }
  }

  Widget showSuccessMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return Text(
        _errorMessage,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.green,
          height: 1.0,
          fontWeight: FontWeight.w300
        ),
        textAlign: TextAlign.center,
      );
    } 
    else {
      return Container(
        height: 0.0,
      );
    }
  }

  /// Widget that shows the toto logo. Only UI
  Widget showLogo() {
    return Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 90.0, //changed from 48
          child: Image.asset('assets/logo-v2.png'),
        ),
      ),
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 70.0, 30.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Email',
          icon: Icon(
            Icons.mail,
            color: Colors.grey,
          ),
        ),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 30.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Password',
          icon:  Icon(
            Icons.lock,
            color: Colors.grey,
          )
        ),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget showCreateAccountButton() {
    return FlatButton(
      child: Text(
        'Don\'t have an account? Sign up',
        style: TextStyle(
          fontSize: 18.0, 
          fontWeight: FontWeight.w300
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignupPage(
            auth: widget.auth,
            loginCallback: widget.loginCallback,)
          )
        );
      }
    );
  }

  Widget showLoginButton() {
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
            'Login',
            style: TextStyle(
              fontSize: 20.0, 
              color: Colors.deepOrange
            )
          ),
          onPressed: validateAndSubmit,
        ),
      ),
    );
  }

  Widget signInFacebook() {
      return Padding(
        padding: EdgeInsets.fromLTRB(50.0, 35.0, 50.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: FacebookSignInButton(
            onPressed: (){},
          ),
        )
      );
    }

  Widget signInGogle() {
    return Padding(
      padding: EdgeInsets.fromLTRB(50.0, 35.0, 50.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: GoogleSignInButton(
          onPressed: (){},
          darkMode: true,
        ),
      ),
    );
  }

}


