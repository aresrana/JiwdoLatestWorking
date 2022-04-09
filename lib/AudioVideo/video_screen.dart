import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jiwdopani/AudioVideo/home_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:io' as IO;
import 'package:get/get.dart';


class VideoScreen extends StatefulWidget {

  final String id;

  VideoScreen({this.id});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
   // @override
    //dispose(){
      //SystemChrome.setPreferredOrientations([
        //DeviceOrientation.portraitUp,
          //    ]);
   //   super.dispose();
    //}


    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        loop:true

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //bool isIOS = Theme.of(context).platform == TargetPlatform;
    return SafeArea(
         child: IO.Platform.isIOS
           ? Scaffold(
         appBar: AppBar(
           toolbarHeight: 30,
             backgroundColor: Colors.indigo[900],
             automaticallyImplyLeading: false,
                  leading: IconButton(
                 icon: Icon(
                   Icons.arrow_back,
                   color: Colors.black,
                   size: 20,
                 ),
                 onPressed: () => Get.to(HomeScreen()))),
                // Navigator.of(context).pushReplacement(
                   //  MaterialPageRoute(builder: (_) => HomeScreen()))))
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () {
          print('Player is ready.');
        },
      ),
    )
      : Scaffold(
          // appBar: AppBar(
           //  automaticallyImplyLeading: false,
           //  backgroundColor: Colors.indigo[900],
           //),
           body: YoutubePlayer(
             controller: _controller,
             showVideoProgressIndicator: true,
             onReady: () {
               print('Player is ready.');
             },
           ),
         )
    );
  }
}