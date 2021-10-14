
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiwdopani/UserMenuOption/read_option.dart';

import 'englishArchive.dart';
import 'englishMain.dart';
import 'nepaliArchive.dart';
import 'nepaliMain.dart';


class BreadMain extends StatefulWidget {
  @override
  _BreadMainState createState() => _BreadMainState();
}

class _BreadMainState extends State<BreadMain> {
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
              title: Text('Choose Language ! '
                           'भाषा छान्नुहोस् !',
                  style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              centerTitle: true,
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 25,
                  ),
                  onPressed: () =>
                      Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => ReadOption())))),

          body: Container(
                        child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 150.0, 30.0, 30.0),
                    child: Center(
                      child: Wrap(spacing: 20, runSpacing: 20.0, children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NepaliMain()));
                            },
                            child: SizedBox(
                              width: 130.0,
                              height: 130.0,
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
                                            Icons.bookmark ,
                                            size: 38,
                                            color: Colors.black,
                                          ),
                                          //     Image.asset("assets/todo.png",width: 64.0,),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Text(
                                            "नेपाली",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 27.0,
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
                                    builder: (context) => EnglishMain())),
                            child: SizedBox(
                              width: 130.0,
                              height: 130.0,
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
                                            Icons.bookmark,
                                            size: 38,
                                          ),
                                          //    Image.asset("assets/note.png",width: 64.0,),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Text(
                                            "English",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0),
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
                                    builder: (context) => NepaliArchive())),
                            child: SizedBox(
                              width: 130.0,
                              height: 130.0,
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
                                            Icons.bookmark,
                                            size: 38,
                                          ),
                                          //    Image.asset("assets/note.png",width: 64.0,),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Text(
                                            "नेपाली सँग्रह",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0),
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
                                    builder: (context) => EnglishArchive())),
                            child: SizedBox(
                              width: 130.0,
                              height: 130.0,
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
                                            Icons.bookmark,
                                            size: 38,
                                          ),
                                          //    Image.asset("assets/note.png",width: 64.0,),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Text(
                                            "English Archive",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0),
                                          ),

                                        ],
                                      ),
                                    )),
                              ),
                            ))
                        
                      ]),
                  ),
                  )],
                             ),

                                          ),

                     ),



           ),

    );


}

}
