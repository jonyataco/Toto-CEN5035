import 'package:flutter/material.dart';
import 'package:toto_real/Services/authentication.dart';
import './Widgets/TotoAppBar.dart';
import './Widgets/showLogo.dart';

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
  String _errorMessage;
  String _successMessage;
  bool _isLoading;

  @override
  void initState() {
    _errorMessage = "";
    _successMessage = "";
    print(_successMessage);
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

  /// Performs create account
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _successMessage = "";
      _isLoading = true;
    });

    // If form is valid then try to signup
    if (validateAndSave()) {
      String userId = "";
      userId = await widget.auth.signUp(
        _email, 
        _password, 
        _first_name,
        _last_name,
        _pet_name,
      );
      setState(() {
        _isLoading = false;
      });

      // Checks if the userId return is valid, meaning the signUp completed
      // without errors. If so, then go back to the sign in page and sign in
      if (userId.length > 0 && userId != null) {
        _successMessage = 'Account creation successful! 🐶';
      }
      else {
        _errorMessage = 'Email is already being used! Please choose a different email';
      }

      setState(() {
        _isLoading = false;
        _formKey.currentState.reset();
      });

    }
    // Else reset the form
    else {
      _isLoading = false;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TotoAppBar('Create an account'),
      body: Stack(
        children: <Widget>[
          Container(
            height: 800,
            width: 600,
            child: Align(
              child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    ShowLogo(),
                    showSuccessMessage(),
                    showErrorMessage(),
                    showFirstNameInput(),
                    showLastNameInput(),
                    showPetNameInput(),
                    showEmailInput(),
                    showPasswordInput(),
                    showCreateAccountButton(),
                  ],
                )
              )
            )
          )
        ],
      ),
    );
  }

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
    if (_successMessage.length > 0 && _successMessage != null) {
      return Text(
        _successMessage,
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

  Widget showFirstNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 30.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'First Name',
          icon: Icon(
            Icons.person,
            color: Colors.grey,
          ),
        ),
        validator: (value) => value.isEmpty ? 'First name can\'t be empty' : null,
        onSaved: (value) => _first_name = value.trim(),
      ),
    );
  }

  Widget showLastNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 30.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Last Name',
          icon: Icon(
            Icons.person,
            color: Colors.grey,
          ),
        ),
        validator: (value) => value.isEmpty ? 'Last name can\'t be empty' : null,
        onSaved: (value) => _last_name = value.trim(),
      ),
    );
  }

  Widget showPetNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 30.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Pet Name',
          icon: Icon(
            Icons.pets,
            color: Colors.grey,
          ),
        ),
        validator: (value) => value.isEmpty ? 'Pet name can\'t be empty' : null,
        onSaved: (value) => _pet_name = value.trim(),
      ),
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 30.0, 0.0),
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
            'Create Account',
            style: TextStyle(
              fontSize: 20.0, 
              color: Colors.white
            )
          ),
          onPressed: validateAndSubmit,
        ),
      ),
    );
  }
}

