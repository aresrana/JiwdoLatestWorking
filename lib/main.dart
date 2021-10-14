import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jiwdopani/UserLogIn/login_page.dart';
import 'package:jiwdopani/services/authservice.dart';

import 'package:jiwdopani/UserLogIn/MenuUse.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {'/':(context)=>AuthService().handleAuth()});
  }
  //home: AuthService().handleAuth());
}
