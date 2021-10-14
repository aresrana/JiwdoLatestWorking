import 'package:flutter/material.dart';
import 'package:jiwdopani/Promoters/ProMenu.dart';
import 'package:jiwdopani/Promoters/PromotersMain.dart';
import '../Admin/adminPage.dart';
import 'reset.dart';
import '../services/authservice.dart';
import 'signup.dart';
import 'dart:async';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String email, password;

  //To check fields during submit
  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  //To Validate email
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WillPopScope(
            onWillPop:()=> Future.value(false),
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor:Colors.white,
                body: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Form(key: formKey, child: _buildLoginForm())))
        )); }

  _buildLoginForm() {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(children: [
          SizedBox(height: 75.0),
          Container(
              height: 200.0,
              width: 200.0,
              child: Stack(
                children: [
                  Text('जिउँदो',
                      style: TextStyle(fontSize: 90.0,color: Colors.indigo)),
                  Positioned(
                      top: 90.0,
                      child: Text('पानी',
                          style:
                          TextStyle(fontSize: 90.0,color:Colors.indigo))),
                ],
              )),
          SizedBox(height: 25.0),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'EMAIL',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      color: Colors.grey.withOpacity(0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color:Colors.indigo),
                  )),
              onChanged: (value) {
                this.email = value;
              },
              validator: (value) =>
              value.isEmpty ? 'Email is required' : validateEmail(value)),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'PASSWORD',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      color: Colors.grey.withOpacity(0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo),
                  )),
              obscureText: true,
              onChanged: (value) {
                this.password = value;
              },
              validator: (value) =>
              value.isEmpty ? 'Password is required' : null),
          SizedBox(height: 5.0),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ResetPassword()));
              },
              child: Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(top: 15.0, left: 20.0),
                  child: InkWell(
                      child: Text('Forgot Password',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontFamily: 'Trueno',
                              fontSize: 13.0,
                              decoration: TextDecoration.underline))))),
          SizedBox(height: 40.0),
          GestureDetector(
            onTap: () {
              if (checkFields()) AuthService().signIn(email, password, context);
            },
            child: Container(
                height: 55.0,
                child: Material(
                    borderRadius: BorderRadius.circular(25.0),
                    shadowColor: Colors.indigo,
                    color: Colors.indigo,
                    elevation: 10.0,
                    child: Center(
                        child: Text('LOGIN',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Trueno'))))),
          ),
          SizedBox(height: 25.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('New to Jiwdo Pani ?'),
            SizedBox(width: 5.0),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignupPage()));
                },
                child: Text('Register',
                    style: TextStyle(
                        color: Colors.indigo,
                        fontFamily: 'Trueno',
                        decoration: TextDecoration.underline)))
          ]),
          SizedBox(height: 10.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(width: 20.0),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AdminPage()));
              },
              child: Text('Admin',
                  style: TextStyle(
                      color: Colors.indigo,
                      fontFamily: 'Trueno',
                      fontSize:17,
                      decoration: TextDecoration.underline)),
            ),
            Icon(Icons.account_circle,color:Colors.indigo,)

          ]),
          SizedBox(height: 6.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(width: 20.0),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PromotersLogin()));
              },
              child: Text('Promoters',
                  style: TextStyle(
                      color: Colors.indigo,
                      fontFamily: 'Trueno',
                      fontSize:17,
                      decoration: TextDecoration.underline)),
            ),
            Icon(Icons.account_circle,color:Colors.indigo,)

          ]),
        ]));
  }
}