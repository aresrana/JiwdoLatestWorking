import 'package:flutter/material.dart';
import 'package:jiwdopani/Contact/contact.dart';

import 'ProcontactDetails.dart';
import 'prohome.dart';


class ProContactMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Credits',
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
      ),
      home: Home(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }

  generateRoute(RouteSettings settings) {
    final path = settings.name.split('/');
    final contactName = path[1];
     Contact contact = contacts.firstWhere((myroute) => myroute.contactName == contactName);
        return MaterialPageRoute(
      settings: settings,
      builder: (context) => ContactDetails(contact)
    );
  }
}