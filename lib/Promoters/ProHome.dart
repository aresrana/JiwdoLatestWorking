import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(

          decoration : new BoxDecoration(
              image: new DecorationImage(

                fit: BoxFit.cover,
                image: new AssetImage("assets/lasthai.png"),

              )
          ),
                 )
    );



  }
}
