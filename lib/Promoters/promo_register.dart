import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jiwdopani/Promoters/promo_register.dart';
import 'package:jiwdopani/Promoters/promo_users.dart';
import 'package:http/http.dart' as http;
import 'package:jiwdopani/UserLogIn/login_page.dart';

import 'PromotersMain.dart';


class PromotersRegister extends StatefulWidget {
  PromotersRegister({ Key key}) : super(key: key);

  @override
  _PromotersRegisterState createState() => _PromotersRegisterState();
}

class _PromotersRegisterState extends State<PromotersRegister> {
  final _formKey = GlobalKey<FormState>();
  PromoUser promoUser = PromoUser(
      "",
      "",
      "",
      "",
      "",
      "",
      "");
  String url = "http://192.168.1.7:8083/adduser";

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    return null;
  }

  Future save() async {
    // print("afdsadfd");
    var res = await http.post(Uri.parse(url),

        headers: {
          'Content-Type': 'application/json'
        },
        body: json.encode({
          "name": promoUser.name,
          "email": promoUser.email,
          "password": promoUser.password,
          //"churchname": promoUser.churchname,
          "churchaddress": promoUser.churchaddress,
          //"useraddress": promoUser.useraddress,
          //"phonenumber": promoUser.phonenumber,
        }));

    print(res.body);
    if (res.body != null) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(

            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(children: [
                      Container(
                        //  decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.white,Colors.indigo])),
                        // height: 400,
                        //  width: MediaQuery.of(context).size.width,
                        //  // ignore: prefer_const_constructors
                        //  decoration: BoxDecoration(
                        //      color: Colors.indigo,
                        //      // ignore: prefer_const_constructors
                        //      borderRadius: BorderRadius.only(
                        //          bottomLeft: const Radius.circular(90),
                        //          // ignore: prefer_const_constructors
                        //          bottomRight: Radius.circular(30))),
                        child: Padding(padding: const EdgeInsets.all(16.0),

                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                // ignore: prefer_const_constructors
                                SizedBox(
                                  height: 10,
                                ),
                                // Icon(Icons.account_circle,size:100,color:Colors.indigo[900],),

                                //ignore: prefer_const_constructors
                                const Text("Register",
                                    style: TextStyle(
                                        fontFamily: 'blk',
                                        color: Colors.indigo,
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.bold
                                    )),
                                Container(
                                  height: 5,
                                  // ignore: prefer_const_constructors
                                ),
                                // ignore: prefer_const_constructors
                                TextFormField(
                                  style: TextStyle(

                                      fontSize: 20
                                  ),
                                  decoration: InputDecoration(
                                    // border: OutlineInputBorder(
                                    //   borderSide: BorderSide(color:Colors.red)
                                    //                                ),
                                      labelText: 'Name',
                                      labelStyle: TextStyle(
                                        //fontFamily: 'pure',
                                          fontSize: 15.0,
                                          color: Colors.indigo),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.indigo),
                                      )
                                  ),
                                  controller: TextEditingController(
                                      text: promoUser.name),
                                  onChanged: (val) {
                                    promoUser.name = val;
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter Your Full Name';
                                    }
                                    return null;
                                  },),
                                //Container(
                                // height: 1,
                                // ignore: prefer_const_constructors
                                //  color: Colors.indigo),
                                const SizedBox(height: 5),
                                // ignore: prefer_const_constructors
                                // TextFormField(
                                //   style: TextStyle(
                                //
                                //       fontSize: 20
                                //   ),
                                //   decoration: InputDecoration(
                                //     // border: OutlineInputBorder(
                                //     //   borderSide: BorderSide(color:Colors.red)
                                //     //                                ),
                                //       labelText: 'Church',
                                //       labelStyle: TextStyle(
                                //         //fontFamily: 'pure',
                                //           fontSize: 15.0,
                                //           color: Colors.indigo),
                                //       focusedBorder: UnderlineInputBorder(
                                //         borderSide: BorderSide(
                                //             color: Colors.indigo),
                                //       )
                                //   ),
                                //   controller: TextEditingController(
                                //       text: promoUser.churchname),
                                //   onChanged: (val) {
                                //     promoUser.churchname = val;
                                //   },
                                //   validator: (value) {
                                //     if (value.isEmpty) {
                                //       return 'Please Enter Your Church Name';
                                //     }
                                //     return null;
                                //   },),
                                //Container(
                                // height: 1,
                                // ignore: prefer_const_constructors
                                //  color: Colors.indigo),
                                const SizedBox(height: 5),
                                // ignore: prefer_const_constructors
                                TextFormField(
                                  style: TextStyle(

                                      fontSize: 20
                                  ),
                                  decoration: InputDecoration(
                                    // border: OutlineInputBorder(
                                    //   borderSide: BorderSide(color:Colors.red)
                                    //                                ),
                                      labelText: 'Church Address',
                                      labelStyle: TextStyle(
                                        //fontFamily: 'pure',
                                          fontSize: 15.0,
                                          color: Colors.indigo),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.indigo),
                                      )
                                  ),
                                  controller: TextEditingController(
                                      text: promoUser.churchaddress),
                                  onChanged: (val) {
                                    promoUser.churchaddress = val;
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter Your Church Address';
                                    }
                                    return null;
                                  },),
                                //Container(
                                // height: 1,
                                // ignore: prefer_const_constructors
                                //  color: Colors.indigo),

                                const SizedBox(height: 5),
                                // ignore: prefer_const_constructors
                                // TextFormField(
                                //   style: TextStyle(
                                //
                                //       fontSize: 20
                                //   ),
                                //   decoration: InputDecoration(
                                //     // border: OutlineInputBorder(
                                //     //   borderSide: BorderSide(color:Colors.red)
                                //     //                                ),
                                //       labelText: 'Home Address',
                                //       labelStyle: TextStyle(
                                //         //fontFamily: 'pure',
                                //           fontSize: 15.0,
                                //           color: Colors.indigo),
                                //       focusedBorder: UnderlineInputBorder(
                                //         borderSide: BorderSide(
                                //             color: Colors.indigo),
                                //       )
                                //   ),
                                //   controller: TextEditingController(
                                //       text: promoUser.useraddress),
                                //   onChanged: (val) {
                                //     promoUser.useraddress = val;
                                //   },
                                //   validator: (value) {
                                //     if (value.isEmpty) {
                                //       return 'Please Enter Your Home Address';
                                //     }
                                //     return null;
                                //   },),
                                // //Container(
                                // // height: 1,
                                // // ignore: prefer_const_constructors
                                // //  color: Colors.indigo),
                                // const SizedBox(height: 5),
                                // TextFormField(
                                //   style: TextStyle(
                                //
                                //       fontSize: 20
                                //   ),
                                //   decoration: InputDecoration(
                                //     // border: OutlineInputBorder(
                                //     //   borderSide: BorderSide(color:Colors.red)
                                //     //                                ),
                                //       labelText: 'Phone Number',
                                //       labelStyle: TextStyle(
                                //         //fontFamily: 'pure',
                                //           fontSize: 15.0,
                                //           color: Colors.indigo),
                                //       focusedBorder: UnderlineInputBorder(
                                //         borderSide: BorderSide(
                                //             color: Colors.indigo),
                                //       )
                                //   ),
                                //   controller: TextEditingController(
                                //       text: promoUser.phonenumber),
                                //   onChanged: (val) {
                                //     promoUser.phonenumber = val;
                                //   },
                                //   validator: (value) {
                                //     if (value.isEmpty) {
                                //       return 'Please Enter Your Phone Address';
                                //     }
                                //     return null;
                                //   },),
                                //Container(
                                // height: 1,
                                // ignore: prefer_const_constructors
                                //  color: Colors.indigo),
                                const SizedBox(height: 5),
                                TextFormField(
                                    style: TextStyle(

                                        fontSize: 20
                                    ),
                                    decoration: InputDecoration(
                                      // border: OutlineInputBorder(
                                      //   borderSide: BorderSide(color:Colors.red)
                                      //                                ),
                                        labelText: 'Email Address',
                                        labelStyle: TextStyle(
                                          //fontFamily: 'pure',
                                            fontSize: 15.0,
                                            color: Colors.indigo),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.indigo),
                                        )
                                    ),
                                    controller: TextEditingController(
                                        text: promoUser.email),
                                    onChanged: (val) {
                                      promoUser.email = val;
                                    },
                                    validator: (value) =>
                                      value.isEmpty
                                          ? 'Please Enter Email'
                                          : validateEmail(value)
                                    ),
                                //Container(
                                // height: 1,
                                // ignore: prefer_const_constructors
                                //  color: Colors.indigo),
                                const SizedBox(height: 5),
                                TextFormField(
                                  style: TextStyle(
                                      fontSize: 20
                                  ),
                                  decoration: InputDecoration(
                                    //  border: OutlineInputBorder(),
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Trueno',
                                          fontSize: 15.0,
                                          color: Colors.indigo),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.indigo),
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
                                    else if (value.length < 6) {
                                      return 'Your password should be minimum of 6 characters';
                                    }

                                    {
                                      return null;
                                    }
                                  },),
                                const SizedBox(height: 35),
                                Container(
                                    height: 40,
                                    width: 230,
                                    // ignore: deprecated_member_use
                                    child: RaisedButton(
                                      elevation: 30,
                                      color: Colors.indigo,
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          save();
                                        }
                                      },

                                      child: Text("Get Me In", style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20.0)
                                      ),
                                      // ignore: prefer_const_constructors
                                      //child: Icon(
                                      //Icons.arrow_forward_sharp,
                                      // color: Colors.indigo[900],
                                    )
                                ),
                                const SizedBox(height: 25),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PromotersLogin()));
                                    },

                                    child: Text("Already Have An Account ?",
                                        style: const TextStyle(
                                            color: Colors.indigo,
                                            fontSize: 17,
                                            decoration: TextDecoration
                                                .underline,
                                            fontWeight: FontWeight.bold))),
                                const SizedBox(height: 14),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    },

                                    child: Text("Get Back",
                                        style: const TextStyle(
                                            color: Colors.indigo,
                                            fontSize: 17,
                                            decoration: TextDecoration
                                                .underline,
                                            fontWeight: FontWeight.bold))),
                                //Icon(Icons.account_circle,color:Colors.indigo)
                              ],
                            )),
                      ),

                      // ignore: sized_box_for_whitespace


                    ]))))));
  }
}
