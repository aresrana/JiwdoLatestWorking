import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'contact.dart';

class ContactDetails extends StatelessWidget {
  final Contact contact;

  ContactDetails(this.contact);

  @override
  Widget build(BuildContext context) {
    final myImage = Hero(
      tag: contact.contactName,
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height / 2,
        decoration: new BoxDecoration(
            image: new DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  contact.contactImage),
            )
        ),
      ),
    );


    final myDetails = Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(children: <Widget>[
                  Container(child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(
                          child: Icon(FontAwesomeIcons.whatsapp,
                            color: Colors.indigo[900],
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(child: Text(contact.contactPhone,
                            style: TextStyle(
                                color: Colors.black, fontSize: 18.0)),),
                      ),

                    ],)),
                ],)
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(children: <Widget>[
                  Container(child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(
                          child: Icon(FontAwesomeIcons.solidEnvelope,
                            color: Colors.indigo[900],
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(child: Text(contact.contactEmail,
                            style: TextStyle(
                                color: Colors.black, fontSize: 18.0)),),
                      ),

                    ],)),
                ],)
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(children: <Widget>[
                  Container(child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(
                          child: Icon(FontAwesomeIcons.asterisk,
                            color: Colors.indigo[900],
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Container(child: Text(contact.designation,
                            style: TextStyle(
                                color: Colors.black, fontSize: 22.0)),),
                      ),

                    ],)),
                ],)
            ),




          ],
        ),

      ),
    );


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(icon: Icon(FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ), onPressed: () => Navigator.of(context).pop(),),
          title: Text(contact.contactName),
                 ),
        body: Column(
          children: <Widget>[
            myImage,
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 8.0, right: 8.0),
              child: myDetails,
            ),
          ],
        ),
      ),
    );
  }
}