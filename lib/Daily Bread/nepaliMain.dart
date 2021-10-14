
import 'dart:io';

import 'package:jiwdopani/Precious/file_page.dart';
import 'package:jiwdopani/Precious/firebase_file.dart';
import 'package:jiwdopani/Precious/preApi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'breadMain.dart';

// ignore: non_constant_identifier_names
NepaliMain() => MyApp();

class MyApp extends StatelessWidget {
  static final String title = "Today's Meditation";


  @override
  Widget build(context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    //color: Colors.indigo[900],
    home: MainPage(),
  );
}

class MainPage extends StatefulWidget {
  String get file => null;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  AudioPlayer player = AudioPlayer();
  Future<List<FirebaseFile>> futureFiles;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    futureFiles = preApi.listAll('EnglishBread/');
  }

  @override
  Widget build(context) =>
      SafeArea(

          child: WillPopScope(
              onWillPop: () => Future.value(false),
              child: Scaffold(
                                 appBar: AppBar(
                    backgroundColor: Colors.indigo[900],
                    title: Text(MyApp.title),
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () async {
                          player.pause();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BreadMain()));
                        })),
                body: FutureBuilder<List<FirebaseFile>>(
                  future: futureFiles,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasError) {
                          return Center(child: Text('Some error occurred!'));
                        } else {
                          final files = snapshot.data;

                          List fileFiltered = [];

                          //itemCount: files.length,
                          for (var i = 0; i < files.length; i++) {
                            var file = files[i];
                            final DateTime now = DateTime.now();
                            final DateFormat formatter = DateFormat(
                                "dd MMMM yyyy");
                            String today = formatter.format(now);
                            DateTime currentDate = new DateFormat(
                                "dd MMMM yyyy").parse(today);
                            var b = file.name
                                .split('.')
                                .first;
                            DateTime fileDate = new DateFormat("dd MMMM yyyy")
                                .parse(b);
                            if (fileDate.compareTo(currentDate) == 0) {

                              fileFiltered.add(file);
                            }
                          }


                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              //buildHeader(files.length),
                              const SizedBox(height: 12),
                              Expanded(

                                child: ListView.builder(
                                    itemCount: fileFiltered.length,
                                    itemBuilder: (context, index) {
                                      final file = fileFiltered[index];

                                      return playAudio(context, file);
                                    }
                                  //else
                                  // return null;

                                ),
                              ),
                            ],
                          );
                        }
                    }
                  },
                ),
              )));

  @override
  void dispose() {
    super.dispose();
    player.dispose();
    WidgetsBinding.instance.removeObserver(this);
 }

 @override
 void didChangeAppLifecycleState(AppLifecycleState state){
    super.didChangeAppLifecycleState(state);
   if (state == AppLifecycleState.paused){
     player.stop();
   }
   else
     player.play();

 }


  @override
  playAudio(context,FirebaseFile file) {
    player.setAsset('assets/JPaudio.mp3');
    player.play();
     return readDaily(context, file);
    }



  Widget readDaily(context, FirebaseFile file) => Container(

    //color: Colors.blue,,
  decoration: BoxDecoration(
  image: DecorationImage(
  image:AssetImage("assets/JiwdoLogo.png"),
  fit:BoxFit.cover,
  alignment: Alignment.topCenter,)),

    child: Column(

      children: [
        SizedBox(
          height:360,
        ),
    Container(
                 child:Text("Presents Daily Meditation For",style:TextStyle
            (
            fontFamily: 'cookie',
            fontSize: 40,
            color:Colors.black
          ),),
        ),
       // SizedBox(
         // height:40,
       // ),
         InkWell(

         onTap: () {
           player.stop();
           Navigator.of(context).push(MaterialPageRoute(
               builder: (context) => FilePage(file: file)));
             },
          child: Card(

            elevation:30,
          shadowColor:Colors.blue,

          child:Text(file.name.split('.').first,style:TextStyle
            (
              fontFamily: 'cookie',
              fontSize: 40,
              color:Colors.blue
          ),),


        ),


           ),
        Container(
          child: Text("Please Tap Above For Exposition",
          style: TextStyle
            (
            fontSize:14
          ),)

         )

      ],
    )

);


  }
