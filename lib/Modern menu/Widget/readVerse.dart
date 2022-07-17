import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jiwdopani/itt/home_screen.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;
import 'package:animated_text_kit/animated_text_kit.dart';

const colorizeColors = [
  Colors.red,
  Colors.purple,
  Colors.blue,
  Colors.yellow,

];

const colorizeTextStyle = TextStyle(
  fontSize: 16.0,
  fontFamily: 'Horizon',
);
class ReadVerse extends StatefulWidget {
  @override
  _ReadVerseState createState() => _ReadVerseState();
}

class _ReadVerseState extends State<ReadVerse> {


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
      body : Container(
        height: MediaQuery.of(context).size.height*0.25,
        color: Colors.white,
          alignment: Alignment.center,

      child: Column(

                    children: <Widget>[
                      FirebaseAnimatedList(
                        scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            query: _ref,
                            itemBuilder: (BuildContext english, DataSnapshot snapshot,
                                Animation<double> animation, int index) {
                              Map readVerse = snapshot.value;
                              readVerse['key'] = snapshot.key;
                              return
                               //Text( readVerse['text'],style: TextStyle(fontSize: 12),);
                                _buildContactItem(readPromise: readVerse);
                            },

                      ),
                       SizedBox(
                         height: 10,
                       ),

                       FirebaseAnimatedList(
                         scrollDirection: Axis.vertical,

                            shrinkWrap: true,
                            query: _que,
                            itemBuilder: (BuildContext nepali, DataSnapshot snapshot,
                                Animation<double> animation, int index) {
                              Map readNepaliVerse = snapshot.value;
                              readNepaliVerse['key'] = snapshot.key;
                              return _buildItem(readNepaliPromise: readNepaliVerse);

                            }),
                      SizedBox(
                        height :10
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.4,
                      child: InkWell(
                          onTap: () {  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));},
                          child: Padding(
                              padding: EdgeInsets.only(top:8.0),
                              child : Column (
                                children: <Widget> [
                                  Icon(
                                      Icons.calendar_view_day

                                  ),
                                  Text("Read Verse")

                                ],
                              )

                          )

                      ))

                    ]
    )

    ));
  }




}

Widget _buildContactItem({readPromise,readNepaliPromise}) {
  return Container(

    padding: EdgeInsets.fromLTRB(5,10,05,10),
        //color: Colors.indigo,
        //child: Container(
          //height: 200
          child:Column(
             // mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          AnimatedTextKit  (

            repeatForever: true,

            animatedTexts: [
              TyperAnimatedText( readPromise['text'],textAlign : TextAlign.center,textStyle: TextStyle(fontSize: 12),
                  speed: Duration(milliseconds: 250))
            ],
          ),
          // Marquee(
          //   textDirection: ui.TextDirection.ltr,
          //     directionMarguee: DirectionMarguee.oneDirection,
          //     //animationDuration: Duration(seconds:50),
          //
          //     child:Text(readPromise['text'])),
        //Text(
           //  readPromise['text'],
         // style: TextStyle(fontSize:16,color: Colors.black),
                     //),

      //     // ),
      // AnimatedTextKit(
      //                   repeatForever: true,
      //
      //                   animatedTexts:[
      //
      //                     ColorizeAnimatedText(
      //                       readPromise['verse'],textStyle: colorizeTextStyle,
      //                       colors:colorizeColors
      //                     )
      //                   ]
      //
      //
      //
      //                 )
          Text(readPromise['verse'],
            style: TextStyle(fontSize:13,color: Colors.red),

          ),
            ]
          )
  );
  }

Widget _buildItem({readNepaliPromise}) {
  return Container(
  child: Column(
      //mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            AnimatedTextKit  (
              repeatForever: true,

              animatedTexts: [
                TyperAnimatedText(readNepaliPromise['promise'],textAlign:TextAlign.center,textStyle: TextStyle(fontSize: 12),
                speed: Duration(milliseconds: 250))
              ],
            ),

            // AnimatedTextKit(
            //   repeatForever: true,
            //
            //   animatedTexts:[
            //
            //     ColorizeAnimatedText(
            //       readNepaliPromise['verse'],textStyle: colorizeTextStyle,
            //       colors:colorizeColors
            //     )
            //   ]
            //
            //
            //
            // )


            // Text(
            //   readNepaliPromise['promise'],
            //   style: TextStyle(fontSize:16,color: Colors.black),
            //   //),
            //
            // // ),
            Text(readNepaliPromise['verse'],
              style: TextStyle(fontSize:13,color: Colors.red),

            )
          ]

  ));
}


