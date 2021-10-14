import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiwdopani/OldIssues/OldIssues.dart';
import 'package:jiwdopani/Promoters/profile.dart';

import 'ProHome.dart';
import 'ProLogOut.dart';
import 'ProMenu.dart';
import 'PromotersMain.dart';

class promotersDash extends StatefulWidget{
  @override
  _promotersDashState createState() => _promotersDashState();

}

class _promotersDashState extends State<promotersDash>{
    int _currentIndex=0;
    List <Widget> tabs=<Widget>[
      ProHome(),
     ProMenu(),
      Profile(),
     // PromotersLogin(),
          ];
  @override
  Widget build(BuildContext context){
    return  //SafeArea(
      WillPopScope(
        onWillPop: () => Future.value(false),
    child: Scaffold(
        //appBar:AppBar(
          //backgroundColor:Colors.indigo[900],
          //title: Text('Getting Started'),
           // automaticallyImplyLeading: false,
           // leading: IconButton(
              //  icon: Icon(Icons.arrow_back),
              //  onPressed: () async => Navigator.push(
                 //   context,
                //    MaterialPageRoute(
                     //   builder: (context) => PromotersLogin()))),
                 // ),

      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:Colors.white,
        unselectedItemColor:Colors.white,
        selectedFontSize:20,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        //backgroundColor: Colors.indigo[900],
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home),
         title: Text('Home',style:TextStyle(color:Colors.white)),
         backgroundColor: Colors.indigo[900],

          ),
          BottomNavigationBarItem(icon:Icon(Icons.menu),
            title: Text('Menu',style:TextStyle(color:Colors.white)),
            backgroundColor: Colors.indigo[900],

          ),
          BottomNavigationBarItem(icon:Icon(Icons.account_circle_outlined),
            title: Text('Profile',style:TextStyle(color:Colors.white)),
            backgroundColor: Colors.indigo[900],

          ),
          // BottomNavigationBarItem(icon:Icon(Icons.exit_to_app_sharp),
          //   title: Text('Log Out',style:TextStyle(color:Colors.white)),
          //   backgroundColor: Colors.indigo[900],
          //
          // )
        ],
        onTap:(index){
          setState(() {
            _currentIndex=index;
          });


        }


      )

    ) );






  }




}