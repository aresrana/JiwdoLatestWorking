import 'dart:core';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:jiwdopani/OTP/loginScreen.dart';
import 'OTPController.dart';
import 'homeScreen.dart';

class AuthUser extends StatefulWidget {
  final String phone;
  final String codeDigits;

  AuthUser({this.phone, this.codeDigits});
  @override
  _AuthUserState createState() => _AuthUserState();
}

class _AuthUserState extends State<AuthUser> {
  Query _ref;

  @override
  void initState() {
    super.initState();

    _ref = FirebaseDatabase.instance
        .reference()
        .child('Subscribers')
        .orderByChild('number')
        .equalTo('${widget.codeDigits + widget.phone}');
  }
//the number in realtime database is +917340868077

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Text(
            'Daily Promise',
            textAlign: TextAlign.center,
          ),
        ),
        body: Container(
            height: double.infinity,
            child: FirebaseAnimatedList(
                query: _ref,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map readVerse = snapshot.value;
                  readVerse['key'] = snapshot.key;
                  return _buildContactItem(readPromise: readVerse);
                })));
  }

  Widget _buildContactItem({readPromise}) {
    if (readPromise['number'] == '${widget.codeDigits + widget.phone}') {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (c) => OTPController(
              phoneNumber: widget.phone, codeDigit: widget.codeDigits)));
    }

    {
      return AlertDialog(
          title: Text(
            'Sorry!',
            style: TextStyle(color: Colors.red),
          ),
          content: Text(
            "You are not a Subscriber or Promoter has not added you as a subscriber! Please do connect to your Promoter!",
            style: TextStyle(color: Colors.indigo[900]),
          ),
          actions: [
            // ignore: deprecated_member_use
            FlatButton(
                child: Text('Try Again'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return HomeScreen();
                  }));
                }),
            // ignore: deprecated_member_use
            FlatButton(
                child: Text('Back To Main Menu'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return LoginScreen();
                  }));
                }),
          ]);
    }
  }
}
