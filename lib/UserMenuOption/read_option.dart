import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiwdopani/Daily%20Bread/breadMain.dart';
import 'package:jiwdopani/JiudoPani/JiudoLatest.dart';
import 'package:jiwdopani/OldIssues/OldIssues.dart';
import 'package:jiwdopani/Precious/PreciousMain.dart' hide MyApp;
import 'package:jiwdopani/UserLogIn/MenuUse.dart';
import 'package:jiwdopani/UserMenuOption/JpSelect.dart';

class ReadOption extends StatefulWidget {
  @override
  _ReadOptionState createState() => _ReadOptionState();
}

class _ReadOptionState extends State<ReadOption> {
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
              title: Text('What do you want to read',
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
                      MaterialPageRoute(builder: (_) => UserMenu())))),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 40.0, 30.0, 30.0),
                    child: Center(
                      child: Wrap(spacing: 20, runSpacing: 20.0, children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JpSelect()));
                            },
                            child: SizedBox(
                              width: 160.0,
                              height: 160.0,
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
                                            Icons.book,
                                            size: 60,
                                            color: Colors.black,
                                          ),
                                          //     Image.asset("assets/todo.png",width: 64.0,),
                                          SizedBox(
                                            height: 25.0,
                                          ),
                                          Text(
                                            "Jiudo Pani",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17.0,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30.0,
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            )),
                        GestureDetector(
                            onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Preciousmain())),
                            child: SizedBox(
                              width: 160.0,
                              height: 160.0,
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
                                            Icons.volunteer_activism,
                                            size: 60,
                                          ),
                                          //    Image.asset("assets/note.png",width: 64.0,),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Text(
                                            "Precious Seed",
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

                        GestureDetector(
                            onTap: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BreadMain())),
                            child: SizedBox(
                              width: 160.0,
                              height: 160.0,
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
                                            Icons.volunteer_activism,
                                            size: 60,
                                          ),
                                          //    Image.asset("assets/note.png",width: 64.0,),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Text(
                                            "Daily Meditation",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17.0),

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
