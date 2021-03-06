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
  FirebaseDatabase.instance.reference().child('Daily Promise');
   Query _que;
  DatabaseReference NepaliReference =
  FirebaseDatabase.instance.reference().child('Daily Promise Nepali');
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat("dd MMMM yyyy");


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    String today = formatter.format(now);

    _ref = FirebaseDatabase.instance
        .reference()
        .child('Daily Promise')
        .orderByChild('date')
        .equalTo(today);

    _que = FirebaseDatabase.instance
        .reference()
        .child('Daily Promise Nepali')
        .orderByChild('date')
        .equalTo(today);

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(


      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text('Daily Promise दैनिक प्रतिज्ञा', textAlign: TextAlign.center,),
      ),

            body: Container(

      decoration: BoxDecoration(
      image: DecorationImage(
      image: AssetImage("assets/promise.jpg"),
      fit: BoxFit.cover,
      )),
        child:SingleChildScrollView(


      child:Column(

      children: <Widget>[
                    Container(
                      //padding: EdgeInsets.all(7),
                      height: MediaQuery.of(context).size.height*0.4,
                      width: MediaQuery.of(context).size.width*0.8,

                      alignment: Alignment.center,

       // height: double.infinity,
        child: FirebaseAnimatedList(
         shrinkWrap: true,
           query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
              Map readVerse = snapshot.value;
              readVerse['key'] = snapshot.key;
               return _buildContactItem(readPromise: readVerse);

              }),

            ),
    SizedBox(
      height: MediaQuery.of(context).size.height*0.1,
    ),

    Container(

      width: MediaQuery.of(context).size.width*0.8,
    //height: double.infinity,
    child: FirebaseAnimatedList(
    shrinkWrap: true,
    query: _que,
    itemBuilder: (BuildContext nepali, DataSnapshot snapshot,
    Animation<double> animation, int index) {
    Map readNepaliVerse = snapshot.value;
    readNepaliVerse['key'] = snapshot.key;
    return _buildItem(readNepaliPromise: readNepaliVerse);

    }),


    ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        )
  ])))


    );
  }



          }

  Widget _buildContactItem({readPromise,readNepaliPromise}) {
             return SingleChildScrollView(
            child: Container(
                 margin: EdgeInsets.all(10),
         // // padding: EdgeInsets.all(20),
          color: Colors.indigo,

          child: Container(
            height: 200,
            padding: EdgeInsets.all(5),
                                 child: Card(
                                                elevation: 0,


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

                                  fontSize: 17,
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
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),

                            )
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Expanded(
                            child: Text(
                              readPromise['date'],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),

                          ],
                        ),






                      ]
                  )

              ),

          ),




    //       )
    )
             );


  }


Widget _buildItem({readNepaliPromise}) {
  return SingleChildScrollView(
      child: Container(
      //
      //   margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.all(5),
         color: Colors.indigo,

        child: Container(
          padding: EdgeInsets.all(10),
          //padding: EdgeInsets.all(20),
          //padding: EdgeInsets.all(10),
          height: 200,

          child: Card(
            elevation: 0 ,

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
                            readNepaliPromise['promise'], textAlign: TextAlign.center,
                            style: TextStyle(

                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    // Row(
                    //   children: [
                    //     SizedBox(
                    //       height:10,
                    //
                    //     ),
                    //     Expanded(
                    //
                    //       child: Text(
                    //         readNepaliPromise['verse'], textAlign: TextAlign.center,
                    //         style: TextStyle(
                    //
                    //             fontSize: 16,
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     )
                    //   ],
                    // ),

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
                              readNepaliPromise['verse'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),

                            )
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Expanded(
                            child: Text(
                              readNepaliPromise['date'],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),

                      ],
                    ),

                  ]
              )

          ),

        ),




    )
  );


}








