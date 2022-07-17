import 'package:flutter/material.dart';

import 'package:jiwdopani/Modern menu/Widget/headerwidget.dart';
import 'package:jiwdopani/Modern menu/Widget/readerwidget.dart';
import 'package:jiwdopani/Modern menu/Widget/readVerse.dart';
import 'package:jiwdopani/Modern menu/Widget/userAcess.dart';

class DashScreen extends StatefulWidget {
  @override
  _DashScreenState createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea (

      child: Scaffold(
      backgroundColor: Colors.white,
      //body: SingleChildScrollView(
      //child:
      body:
      SafeArea(

        child: SingleChildScrollView(
        child:Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           HeaderWidget(),
            Divider(
              color:Colors.black,
              thickness: 5,
            ),
            SizedBox(height: 5),
            Center(
            child:Text('Daily Promise')),

            //SizedBox(height: 20),
            ReadVerse(),
            Divider(
                color:Colors.black,
                thickness: 5
            ),
            SizedBox(
              height: 10,
            ),

               SingleChildScrollView(
                 child:Container(
                child:Column(

                children:<Widget>[

            Center(
              child:Text('User Access')),
            //SizedBox(height: 5),
            UserAccess(),
            Divider(
                color:Colors.black,
                thickness: 5
            ),
            Center(
            child: Text('User Access')),
            //SizedBox(height: 20),
           UserAccess(),
            Divider(
                color:Colors.black,
                thickness: 5
            ),
            Center(
            child:Text('Addressbook')),
           // SizedBox(height: 20),
            ReaderWidget(),
            Divider(
                color:Colors.black,
                thickness: 5
            ),
            Center(
            child:Text('Promoters')),
            //SizedBox(height: 20),
            ReaderWidget(),


              ])))
          ],
        ),
      ),
    )));
  }
}