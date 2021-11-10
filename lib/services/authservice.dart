import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jiwdopani/UserLogIn/MenuUse.dart';
import 'package:jiwdopani/services/error_handler.dart';
import 'package:jiwdopani/UserLogIn/login_page.dart';


class AuthService {
  //Determine if the user is authenticated.
  handleAuth() {
    return StreamBuilder(

        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return UserMenu();
          } else
            return LoginPage();
        });
  }

  //Sign out
 Future signOut() async {
    try {
      return await FirebaseAuth.instance.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }

  }


  //Sign In
  signIn(String email, String password, context) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((val) {
      UserMenu();
                          }).catchError((e) {
      ErrorHandler().errorDialog(context, e);
    });
  }

  //Signup a new user
  signUp(String email, String password) {
    return FirebaseAuth.instance


            .createUserWithEmailAndPassword(email: email, password: password);

  }
//Reset Password
  resetPasswordLink(String email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
  //sign out
// Future signOut()async {
//     try {
//
//     } catch(e){
//
//     }
// }
}