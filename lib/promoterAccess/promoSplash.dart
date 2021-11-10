import 'dart:async';

import 'package:flutter/material.dart';

import 'checkPromo.dart';



class PromoSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => CheckPromo()),
              (Route<dynamic> route) => false);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.green[700],
      body:  Container(

        decoration : new BoxDecoration(
            image: new DecorationImage(

              fit: BoxFit.cover,
              image: new AssetImage("assets/lasthaita.jpg"),

            )
        ),

      )


   );
  }
}

