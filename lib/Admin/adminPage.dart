import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiwdopani/SubmitArticle/submitArticles.dart';
import 'package:jiwdopani/UserLogIn/login_page.dart';
import 'menuAdmin.dart';

class AdminPage extends StatefulWidget {
  VerifyPin createState() => VerifyPin();
}

class VerifyPin extends State<AdminPage> {
  final pinCode = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final refPin = FirebaseDatabase.instance.reference().child("AdminPin");
    String ExactPin = "";

    return WillPopScope(
        onWillPop: () => Future.value(false),
                child: Scaffold(
            appBar: AppBar(
                title: Text('Please Enter Your Pin'),
                backgroundColor: Colors.indigo[900],
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return LoginPage();
                        })))),
            body: Center(
                child: Padding(
                    padding: const EdgeInsets.all(110.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextField(
                              style: TextStyle(color: Colors.indigo),
                              cursorColor: Colors.indigo,
                              controller: pinCode,
                              decoration: InputDecoration(
                                  hintText: 'Enter Your Pin Here')),
                          RaisedButton(
                              color: Colors.indigo[900],
                              onPressed: () {
                                refPin
                                    .child("ExactPin")
                                    .once()
                                    .then((DataSnapshot data) {
                                  setState(() {
                                    ExactPin = data.value;
                                  });
                                  if (pinCode.text == ExactPin) {
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => MenuAdmin()));
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return menuAdmin();
                                    }));
                                  } else {
                                    return showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Error'),
                                            content: Text(
                                                'Please enter the correct pin !'
                                                'Contact to any of the admins if you have forgotten the pin.'
                                                'Thanks!'),
                                            actions: [
                                              FlatButton(
                                                  child: Text('Try Again'),
                                                  onPressed: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                      return AdminPage();
                                                    }));
                                                  }),
                                            ],
                                          );
                                        });
                                  }
                                });
                              },
                              child: Text(
                                'Submit',
                                style: TextStyle(color: Colors.white),
                              )),
                        ])))));
  }
}
