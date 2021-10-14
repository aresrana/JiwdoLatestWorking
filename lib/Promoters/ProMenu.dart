//import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:jiwdopani/ProContacts/ProcontactMain.dart';
import 'package:jiwdopani/Promoters/proSubmitOption.dart';
import 'package:jiwdopani/Promoters/readPromise.dart';

import 'package:jiwdopani/profeed/proFeedback.dart';
import 'package:jiwdopani/ProMenuOption/pro_read_option.dart';
import 'package:jiwdopani/ProAudioVideo/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:jiwdopani/UserLogIn/fab_circulat.dart';
import 'package:jiwdopani/Subscribers/subscribers.dart';
import 'package:jiwdopani/UserLogIn/login_page.dart';




class ProMenu extends StatefulWidget {
  @override
  _ProMenuState createState() => _ProMenuState();
}

class _ProMenuState extends State<ProMenu> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
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
                        MaterialPageRoute(builder: (context) => ProReadOption())),
                    iconSize: 48.0,
                    color: Colors.indigo),
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProSubmitOption())),
                    iconSize: 48.0,
                    color: Colors.indigo),
                IconButton(
                    icon: Icon(Icons.contact_page),
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProContactMain()));
                    },
                    iconSize: 48.0,
                    color: Colors.indigo),
                IconButton(
                    icon: Icon(Icons.video_label_rounded),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => VideoHomeScreen()));
                    },
                    iconSize: 48.0,
                    color: Colors.indigo),
                IconButton(
                    icon: Icon(Icons.question_answer),
                    onPressed: () {

                             Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => ProFeedback()));



                    },
                    iconSize: 48.0,
                    color: Colors.indigo),
                IconButton(
                    icon: Icon(Icons.add_circle),
                    onPressed: () async {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Subscribers()));
                    },
                    iconSize: 48.0,
                    color: Colors.indigo),
                IconButton(
                    icon: Icon(Icons.bookmark),
                    onPressed: () async {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ReadPromisePro()));
                    },
                    iconSize: 48.0,
                    color: Colors.indigo),

                IconButton(
                    icon: Icon(Icons.vpn_lock),
                    onPressed: () async {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    iconSize: 48.0,
                    color: Colors.indigo),
              ],
            ),
          ),
        ));
  }
}
