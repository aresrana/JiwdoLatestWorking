import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'menuAdmin.dart';

class DailyPromiseArchive extends StatefulWidget {
  @override
  _DailyPromiseArchiveState createState() => _DailyPromiseArchiveState();
}

class _DailyPromiseArchiveState extends State<DailyPromiseArchive> {

  Query _ref;
  DatabaseReference reference =
  FirebaseDatabase.instance.reference().child('Daily Promise');
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat("dd MMMM yyyy");


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    String today=formatter.format(now);

    _ref = FirebaseDatabase.instance
        .reference()
        .child('Daily Promise')
        .orderByChild('date');
        //.equalTo(today);

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Text('Daily Promise Archive', textAlign: TextAlign.center,),
          automaticallyImplyLeading: false,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () async => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => menuAdmin())))
        ),
        body:Container(
            height: double.infinity,
            child: FirebaseAnimatedList(
                query: _ref,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map readVerse = snapshot.value;
                  readVerse['key'] = snapshot.key;
                  return _buildContactItem(readPromise: readVerse);
                })
        )
    );
  }
}

Widget _buildContactItem({readPromise}) {
  return SingleChildScrollView(
      child: Container(

        margin: EdgeInsets.symmetric(vertical: 50),
        // padding: EdgeInsets.all(20),
        color: Colors.white,

        child: Container(
          //padding: EdgeInsets.all(10),

          child: Card(

              color: Colors.indigo,
              shadowColor: Colors.black,
              child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Row(
                      children: [
                        SizedBox(
                          height:10,

                        ),
                        Expanded(

                          child: Text(
                            readPromise['text'], textAlign: TextAlign.center,
                            style: TextStyle(

                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 6,
                        ),
                        Expanded(
                            child: Text(
                              readPromise['verse'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),

                            )
                        ),
                        SizedBox(
                          width: 140,
                        ),
                        Expanded(
                            child: Text(
                              readPromise['date'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),

                      ],
                    ),






                  ]
              )

          ),

        ),




      ));


}







