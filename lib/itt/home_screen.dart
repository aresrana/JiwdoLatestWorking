import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiwdopani/Modern menu/Widget/readVerse.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index =0;
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    // to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
   /*   appBar: AppBar(
       flexibleSpace: Container(
         child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
           children : <Widget>[

               Text(
                   'जसले ममाथि विश्वास गर्दछ,पवित्रशास्त्रले भनेअनुसार,उसको हृदयबाट जिउँदो पानीका नदीहरू बहनेछन् ! यूहन्ना ७:३८ ',
                   textAlign: TextAlign.center,
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 20.0,
                       fontWeight: FontWeight.bold)),
               *//*     Text(
                              '4101410141',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontFamily: "Montserrat Regular"),
                            )*//*

           ])



        ),



      ),*/


      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/top_header.png')),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:50),
                           child: Text(
                  'जसले ममाथि विश्वास गर्दछ,पवित्रशास्त्रले भनेअनुसार,उसको हृदयबाट जिउँदो पानीका नदीहरू बहनेछन् ! यूहन्ना ७:३८ ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold)),

    ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 64,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    /*    CircleAvatar(
                          radius: 32,
                          backgroundImage: NetworkImage(
                              'https://i.pinimg.com/originals/78/07/03/78070395106fcd1c3e66e3b3810568bb.jpg'),
                        ),*/
                      /*  SizedBox(
                          width: 16,
                        ),*/
                                       ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Daily Devotion',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Precious Seed',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Audio Video',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Promoters',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Courtesy',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // SvgPicture.network(
                              //'https://image.flaticon.com/icons/svg/1904/1904221.svg',
                              // height: 128,
                              //  ),
                              Text(
                                'User Submission',
                                style: cardTextStyle,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:

      buildBottomNavigation(),
  /*    floatingActionButton: FloatingActionBubble(
                items: <Bubble>[
              Bubble(
                title: "Settings",
                iconColor: Colors.white,
                bubbleColor: Colors.blue,
                icon: Icons.settings,
                titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                onPress: () {
                  _animationController.reverse();
                },
              ),
              Bubble(
                title: "Profile",
                iconColor: Colors.white,
                bubbleColor: Colors.blue,
                icon: Icons.people,
                titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                onPress: () {
                  _animationController.reverse();
                },
              ),
              Bubble(
                title: "Home",
                iconColor: Colors.white,
                bubbleColor: Colors.blue,
                icon: Icons.home,
                titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                onPress: () {
                  _animationController.reverse();
                },
              ),
            ],
            animation: _animation,
            onPress: () => _animationController.isCompleted
                ? _animationController.reverse()
                : _animationController.forward(),
            backGroundColor: Colors.blue,
            iconColor: Colors.white,
            iconData: Icons.menu,
          )*/

    );


  }

  Widget buildBottomNavigation() {
    return Container(

      height: MediaQuery.of(context).size.height*0.1,
      color : Colors.greenAccent,
      child: InkWell(
        onTap: () {  Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ReadVerse()));},
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

      )


    );
  }



 }


