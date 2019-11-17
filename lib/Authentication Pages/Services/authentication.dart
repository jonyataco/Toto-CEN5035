import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Models/new_user.dart';

abstract class BaseAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(
    String email, 
    String password,
    String firstName,
    String lastName,
    String petName
  );

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();
}


/// Class that implement firebase authentication
class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final DatabaseReference _dbref = FirebaseDatabase.instance.reference();

  //Google sign in autehenticaiton
  final GoogleSignIn googleSignIn = GoogleSignIn();

  /// Signs into firebase using firebaseAuth. Returns an empty string if an
  /// error is throw meaning that authentication during sign in was unsucessful
  Future<String> signIn(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
      FirebaseUser user = result.user;
      return user.uid;
    } catch(e) {
      print('ERROR IN FIREBASE SIGN IN: $e');
      // returns empty string on any errors
      return "";
    }
  }

  //Google -----
  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _firebaseAuth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _firebaseAuth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'signInWithGoogle succeeded: $user';


  }
  void signOutGoogle() async{
    await googleSignIn.signOut();

  print("User Sign Out");
  }
  //End of Google ---

  /// Method that performs signUp. The unique identifier for each account is an
  /// email address, so if a user trys to sign up with an email that already 
  /// exists in the authentication database, then the signup method will throw
  /// an error.
  Future<String> signUp(String email, String password, String firstName, String lastName, String petName) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      /* If no errors are thrown from creating an account, then we want to
       * immediately logout. If not the logic with root_page will mess up on
       * reopening the application
       */
      _firebaseAuth.signOut();
      // Adds the user to the database
      _dbref.child('users/' + user.uid).set({
        'firstName' : firstName,
        'lastName' : lastName,
        'petName' : petName,
        'email' : email,
        'photoURL' : 'none',
      });
      // Sets default values for levels,settings, and schedules
      _dbref.child('settings/' + user.uid).set({
        'darkMode' : false,
        'notifications' : true
      });
      _dbref.child('levels/' + user.uid).set({
        'waterLevel' : 100,
        'foodLevel' : 100,
        'waterDispensing' : false,
        'foodDispensing' : false
      });
      // Blank for now but need to come up with a schema 
      _dbref.child('schedules' + user.uid).set({

      });
      return user.uid;
    }
    // Catch any errors that can come from createUserWithEmailAndPassword
    catch (e) {
      print(e);
      return "";
    }
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }
}
