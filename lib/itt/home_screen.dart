import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiwdopani/Daily%20Bread/breadMain.dart';
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
            padding: EdgeInsets.all(50),
                           child: Text(
                  'जसले ममाथि विश्वास गर्दछ,पवित्रशास्त्रले भनेअनुसार,उसको हृदयबाट जिउँदो पानीका नदीहरू बहनेछन् ! यूहन्ना ७:३८ ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold)),

    ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(bottom: 20),
                             ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        GestureDetector(
                        child:Card(
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BreadMain()));
                        },
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

      ReadVerse(),


    );


  }

  Widget buildBottomNavigation() {
    return Container(


      height: MediaQuery.of(context).size.height*0.1,
      color : Colors.greenAccent,
      child: InkWell(
        onTap: () => showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30)
            )
          ),

            isScrollControlled: true,

           context: context, builder: (context) =>ReadVerse()),


        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ReadVerse()));
        //
        //
        //   },*/
        child: Padding(
          padding: EdgeInsets.only(top:8.0),
          child : Column (
            children: <Widget> [
              Icon(
                Icons.calendar_view_day

              ),
              Text("Read promise"),
              Text("प्रतिज्ञा पढ्नुहोस् ")

            ],
          )

        )

      )


    );
  }



 }


