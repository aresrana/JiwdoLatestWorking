import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiwdopani/Promoters/ProJiudoLatest.dart';
import 'package:jiwdopani/OldIssues/OldIssues.dart';
import 'package:jiwdopani/ProMenuOption/pro_read_option.dart';

class JpSelect extends StatefulWidget {
  @override
  _JpSelectState createState() => _JpSelectState();
}

class _JpSelectState extends State<JpSelect> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.indigo[800],
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
              toolbarHeight: 60,
              backgroundColor: Colors.indigo[900],
              automaticallyImplyLeading: false,
              title: Text('Choose Issues!',
                  style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              centerTitle: true,
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 25,
                  ),
                  onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => ProReadOption())))),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 100.0, 30.0, 30.0),
                    child: Center(
                      child: Wrap(spacing: 20, runSpacing: 20.0, children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProJiudoLatest()));
                            },
                            child: SizedBox(
                              width: 190.0,
                              height: 190.0,
                              child: Card(
                                color: Colors.indigo,
                                borderOnForeground: true,
                                shadowColor: Colors.white,
                                elevation: 20.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0)),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.new_releases_rounded,
                                            size: 60,
                                            color: Colors.black,
                                          ),
                                          //     Image.asset("assets/todo.png",width: 64.0,),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Text(
                                            "Latest Edition",
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
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OldIssues()));
                            },
                            child: SizedBox(
                              width: 190.0,
                              height: 190.0,
                              child: Card(
                                color: Colors.indigo,
                                elevation: 20.0,
                                shadowColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0)),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.alarm_outlined,
                                            size: 60,
                                          ),
                                          //    Image.asset("assets/note.png",width: 64.0,),
                                          SizedBox(
                                            height: 20.0,
                                          ),

                                          Text(
                                            "Old Issues",
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
}
