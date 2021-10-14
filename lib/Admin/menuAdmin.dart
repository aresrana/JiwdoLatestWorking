import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jiwdopani/Admin/precious_seedUpload.dart';
import 'package:jiwdopani/Admin/previousJiwdo.dart';
import 'package:jiwdopani/Feedback/getFeedback.dart';
import 'package:jiwdopani/selectVerse/dailyPromise.dart';
import 'adminPage.dart';
import 'getArticles.dart';
import 'getQuiz.dart';
import 'latest_jiwdo.dart';

menuAdmin() => MenuAdmin();

class MenuAdmin extends StatefulWidget {
  @override
  _MenuAdminState createState() => _MenuAdminState();
}

class _MenuAdminState extends State<MenuAdmin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
                child: WillPopScope(
            onWillPop: () async => false,
            child:  Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                    automaticallyImplyLeading: false,
                    toolbarHeight: 80,
                    centerTitle: true,
                    title: Text('Admin Menu'),
                    backgroundColor: Colors.indigo[900],
                    actions: <Widget>[
                      FlatButton.icon(
                        icon: Icon(Icons.person, size: 30, color: Colors.white),
                        label: Text('Logout',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold)),
                                 onPressed: () => Navigator.push(
                                  context,
                                    MaterialPageRoute(
                                      builder: (context) => AdminPage()
                                               ),
                      ))
                    ]
                                 ),
                backgroundColor: Colors.white,
                body: SingleChildScrollView(

                child: Column(children: <Widget>[
                  const SizedBox(height: 50),
                  Center(
                      child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.indigo, // green[300],
                    child:
                        Text('Fetch Articles', style: TextStyle(fontSize: 18)),
                    textColor: Colors.white,
                    padding:
                        EdgeInsets.symmetric(vertical: 30.0, horizontal: 127.0),
                          onPressed: () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => GetArticles())))),
                                    const SizedBox(height: 20),
                  Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.indigo,
                      child: Text('Fetch Quiz Answers',
                          style: TextStyle(fontSize: 18)),
                      textColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 104.0),
                        onPressed: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => GetQuiz())))),
                                      const SizedBox(height: 20),
                  Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.indigo,
                      child: Text('Upload Latest Jiudopani',
                          style: TextStyle(fontSize: 18)),
                      textColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 85.0),
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => latestJiwdo()));
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.indigo,
                      child: Text('Upload Precious Seed',
                          style: TextStyle(fontSize: 18)),
                      textColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 94.0),
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => preciousSeed()));
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.indigo,
                      child: Text('Update Jiudopani',
                          style: TextStyle(fontSize: 18)),
                      textColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 108.0),
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => previousJiwdo()));
                      },
                    ),
                  ),

                      const SizedBox(height: 20),
                  Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.indigo,
                      child: Text('Add Daily Promise',
                          style: TextStyle(fontSize: 18)),
                      textColor: Colors.white,
                      padding:
                      EdgeInsets.symmetric(vertical: 30, horizontal: 108.0),
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DailyPromise()));
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      color: Colors.indigo,
                      child: Text('Get User Feedback',
                          style: TextStyle(fontSize: 18)),
                      textColor: Colors.white,
                      padding:
                      EdgeInsets.symmetric(vertical: 30, horizontal: 108.0),
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GetFeedback()));
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ])))));
  }
}
