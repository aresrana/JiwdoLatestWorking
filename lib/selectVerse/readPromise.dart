import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReadPromise extends StatefulWidget {
  @override
  _ReadPromiseState createState() => _ReadPromiseState();
}

class _ReadPromiseState extends State<ReadPromise> {
  Query _ref;
  DatabaseReference reference =
  FirebaseDatabase.instance.reference().child('Daily Verse');
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat("dd MMMM yyyy");


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String today=formatter.format(now);

    _ref = FirebaseDatabase.instance
        .reference()
        .child('Daily Verse')
        .orderByChild('date')
        .equalTo(today);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text('Daily Promise Archive', textAlign: TextAlign.center,),
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
         return Container(

          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(10),
          height: 130,
          color: Colors.white,
          child: Container(


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
                              width: 6,
                            ),
                            Text(
                              readPromise['text'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              readPromise['verse'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 140,
                            ),
                            Text(
                              readPromise['date'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ]
                  )

              )));


  }







