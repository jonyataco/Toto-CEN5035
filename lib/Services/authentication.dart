import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';

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


  // In the singup, we need to catch various errors
  Future<String> signUp(String email, String password, String firstName, String lastName, String petName) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      // If there is no failure, then create an entry in the database with the following fields
      _dbref.child(user.uid).set({
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'petName': petName
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
