import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:jiwdopani/Promoters/ProMenu.dart';

import 'package:jiwdopani/Promoters/proquiz.dart' hide MyApp;
import 'package:jiwdopani/Promoters/proarticles.dart';


class ProSubmitOption extends StatefulWidget {
  ProMenu proMenu;
  @override
  _ProSubmitOptionState createState() => _ProSubmitOptionState();
}

class _ProSubmitOptionState extends State<ProSubmitOption> {
  @override
  Widget build(context) => SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo[800],
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: Colors.indigo[900],
            automaticallyImplyLeading: false,
            title: Text("What do you want to submit?",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            centerTitle: true,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 25,
                ),
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<dynamic>(
                        builder: (context) => ProMenu())))),


        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: Center(
                    child:
                    Wrap(spacing: 50, runSpacing: 50.0, children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProSubmitQuiz()));
                          },
                          child: SizedBox(
                            width: 200.0,
                            height: 200.0,
                            child: Card(
                              color: Colors.indigo,
                              borderOnForeground: true,
                              shadowColor: Colors.white,
                              elevation: 20.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(50.0),
                                    child: Column(
                                      children: <Widget>[
                                        Icon(
                                          Icons.vpn_key_outlined,
                                          size: 60,
                                          color: Colors.black,
                                        ), //     Image.asset("assets/todo.png",width: 64.0,),
                                        SizedBox(
                                          height: 7.0,
                                        ),
                                        Text(
                                          "Quiz",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProSubmitArticles()));
                          },
                          child: SizedBox(
                            width: 200.0,
                            height: 200.0,
                            child: Card(
                              color: Colors.indigo,
                              elevation: 20.0,
                              shadowColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0)),
                              child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(45.0),
                                    child: Column(
                                      children: <Widget>[
                                        Icon(
                                          Icons.article_outlined,
                                          size: 60,
                                        ),
                                        //    Image.asset("assets/note.png",width: 64.0,),
                                        SizedBox(
                                          height: 7.0,
                                        ),

                                        Text(
                                          "Articles",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17.0),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          )),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
}
