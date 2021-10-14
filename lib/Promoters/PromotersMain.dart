import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jiwdopani/Promoters/promo_register.dart';
import 'package:jiwdopani/Promoters/promo_users.dart';
import 'package:http/http.dart' as http;
import 'package:jiwdopani/Promoters/promotersDash.dart';
import 'package:jiwdopani/UserLogIn/login_page.dart';
import 'dart:async';
import 'promoSplash.dart';

// ignore: use_key_in_widget_constructors
class PromotersLogin extends StatefulWidget {
 PromotersLogin({ Key key}) : super(key: key);

  @override
  _PromotersLoginState createState() => _PromotersLoginState();
}

class _PromotersLoginState extends State<PromotersLogin> {
  final _formKey = GlobalKey<FormState>();

  PromoUser promoUser = PromoUser("", "", "", "", "", "","");
  String url = "http://192.168.1.4:8083/adduser";
  // Pattern pattern =
  //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  // RegExp regex = new RegExp(pattern);
  set email(String email) {}
  Future save() async {
       var res = await http.post(Uri.parse(url),

        headers: {
          'Content-Type': 'application/json'

        },
        body: json.encode({
          "email": promoUser.email,
          "password":promoUser.password
        }));
           // ignore: avoid_print
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    WillPopScope(
        onWillPop: () => Future.value(false),
    child:  Scaffold(
     backgroundColor:Colors.white,
                body: SingleChildScrollView(
                    child: Form(
                key: _formKey,
                child: Column(children: [
                  Container(
                               child: Padding(
                        padding: const EdgeInsets.all(16.0),

                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // ignore: prefer_const_constructors
                            SizedBox(
                              height: 80,
                            ),
                           // Icon(Icons.account_circle,size:100,color:Colors.indigo[900],),

                            //ignore: prefer_const_constructors
                            const Text("Login",
                                  style: TextStyle(
                                  fontFamily:'blk',
                                    color: Colors.indigo,
                                    fontSize:70.0,
                                    fontWeight: FontWeight.bold
                                  )),
                            Container(
                                  height: 60,
                                // ignore: prefer_const_constructors
                                ),
                            // ignore: prefer_const_constructors
                            TextFormField(
                              style: TextStyle(

                                fontSize:20
                              ),
                                decoration: InputDecoration(
                                     // border: OutlineInputBorder(
                                     //   borderSide: BorderSide(color:Colors.red)
                                     //                                ),

                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                        //fontFamily: 'pure',
                                        fontSize: 20.0,
                                        color: Colors.indigo),
                                   focusedBorder: UnderlineInputBorder(
                                   borderSide: BorderSide(color:Colors.indigo),
                                   )
                            ),
                              controller: TextEditingController(
                                  text: promoUser.email),
                              onChanged: (val) {
                                promoUser.email = val;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Email';
                                }
                                // else if (!regex.hasMatch(value)){
                                //   return 'Enter Valid Email';
                                //}
                                return null;
                              },
                            onSaved:(value){
                              promoUser.email = value;
                            }
                              ,),
                            //Container(
                               // height: 1,
                                // ignore: prefer_const_constructors
                              //  color: Colors.indigo),
                            const SizedBox(height: 20),
                            TextFormField(
                              style: TextStyle(
                                  fontSize:20
                              ),
                                  decoration: InputDecoration(
                                  //  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Trueno',
                                      fontSize: 20.0,
                                      color: Colors.indigo),
                                   focusedBorder: UnderlineInputBorder(
                                   borderSide: BorderSide(color:Colors.indigo),
                                 )
                                  ),
                              obscureText: true,
                              controller: TextEditingController(
                                  text: promoUser.password),
                              onChanged: (val) {
                                promoUser.password = val;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                return null;
                              },),
                             //Container(
                                //height: 1,
                                // ignore: prefer_const_constructors
                               // color: Colors.indigo),
                        //     const SizedBox(height: 20),
                        // TextFormField(
                        //   style: TextStyle(
                        //       fontSize:20
                        //   ),
                        //   decoration: InputDecoration(
                        //       border: OutlineInputBorder(),
                        //       labelText: 'PINCODE',
                        //       labelStyle: TextStyle(
                        //           fontFamily: 'Trueno',
                        //           fontSize: 20.0,
                        //           color: Colors.grey.withOpacity(0.5)),
                        //      // focusedBorder: UnderlineInputBorder(
                        //        // borderSide: BorderSide(color:Colors.black),
                        //      // )
                        //     ),
                        //   controller: TextEditingController(
                        //       text: promoUser.pin),
                        //   onChanged: (val) {
                        //     promoUser.pin = val;
                        //   },
                        //   validator: (value) {
                        //     if (value.isEmpty) {
                        //       return 'Please Enter Pincode';
                        //     }
                        //     return null;
                        //   },),
                        //Container(
                          // height: 1,
                           //ignore: prefer_const_constructors
                         //  color: Colors.indigo),
                            const SizedBox(height: 50),
                            Container(
                                height: 55,
                                width: 250,
                                                               // ignore: deprecated_member_use
                                child: RaisedButton(
                                  elevation:30,
                                  color: Colors.indigo,
                                 onPressed: () {
                                   if (_formKey.currentState.validate()) {
                                     print('Logged in');

                                     promotersDash();
                                   }

                                  },
                            
                                  child:Text("Get Me In",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color:Colors.white),),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0)
                                    ),
                                  // ignore: prefer_const_constructors
                                  //child: Icon(
                                  //Icons.arrow_forward_sharp,
                                  // color: Colors.indigo[900],
                                )
                            ),
                           const SizedBox(height: 50),
                          InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PromotersRegister()));
                                    },

                                      child: Text("Don't Have An Account ?",
                                        style: const TextStyle(
                                          color: Colors.indigo,
                                            fontSize: 17,
                                            decoration: TextDecoration.underline,
                                            fontWeight: FontWeight.bold))),
                            const SizedBox(height: 20),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PromoSplash()));
                                },

                                child: Text("Get Back",
                                    style: const TextStyle(
                                        color: Colors.indigo,
                                        fontSize: 17,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold))),
                               //Icon(Icons.account_circle,color:Colors.indigo)
                          ],
                        )),
                  ),

                  // ignore: sized_box_for_whitespace


                ]))))));
  }

  validateEmail(String value) {}
}
