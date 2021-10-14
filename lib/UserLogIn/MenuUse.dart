import 'package:jiwdopani/AudioVideo/home_screen.dart';
import 'package:jiwdopani/Contact/contactMain.dart';

import 'package:jiwdopani/UserMenuOption/read_option.dart';
import 'package:jiwdopani/UserMenuOption/user_submit.dart';
import 'package:jiwdopani/Feedback/userFeedback.dart';
import 'package:jiwdopani/selectVerse/readPromise.dart';
import 'package:jiwdopani/services/authservice.dart';
import 'fab_circulat.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';


import 'login_page.dart';

class UserMenu extends StatefulWidget {

  @override
  _UserMenuState createState() => _UserMenuState();
}

class _UserMenuState extends State<UserMenu> {
  final AuthService _auth= AuthService();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: FabCircularMenu(
              fabOpenIcon: Icon(Icons.add_box, color: Colors.indigo),
              alignment: Alignment.centerLeft,
              ringDiameter: 500,
              ringWidth: 90,
              fabColor: Colors.white,
              child: Container(
                color: Colors.indigo[900],
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(bottom: 256.0),
                  child: Text(
                      'जसले ममाथि विश्वास गर्दछ,पवित्रशास्त्रले भनेअनुसार,उसको हृदयबाट जिउँदो पानीका नदीहरू बहनेछन् ! युहन्ना ७:३८ ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                )),
              ),
              ringColor: Colors.white,
              options: <Widget>[
                IconButton(
                    icon: Icon(Icons.book_outlined,semanticLabel:"Read Magazines",),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReadOption())),
                    iconSize: 48.0,
                    color: Colors.indigo),
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserSubmitOption())),
                    iconSize: 48.0,
                    color: Colors.indigo),
                IconButton(
                    icon: Icon(Icons.contact_page),
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => contactMain()));
                    },
                    iconSize: 48.0,
                    color: Colors.indigo),
                IconButton(
                    icon: Icon(Icons.question_answer),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => UserFeedback()));
                                          },
                    iconSize: 48.0,
                    color: Colors.indigo),
                IconButton(
                    icon: Icon(Icons.video_label_rounded),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    iconSize: 48.0,
                    color: Colors.indigo),
                IconButton(
                    icon: Icon(Icons.bookmark),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ReadPromise()));
                    },
                    iconSize: 48.0,
                    color: Colors.indigo),


                IconButton(
                    icon: Icon(Icons.exit_to_app_rounded),
                    onPressed: () async {
                      _auth.signOut();
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    iconSize: 48.0,
                    color: Colors.indigo),
              ],
            ),
          ),
        ));
      }
}
