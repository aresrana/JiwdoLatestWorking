import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PromotersMain.dart';

class ProLogOut extends StatefulWidget {
  @override
  _ProLogOutState createState() => _ProLogOutState();
}

class _ProLogOutState extends State<ProLogOut> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.indigo[800],
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                toolbarHeight: 60,
                backgroundColor: Colors.indigo[900],
                automaticallyImplyLeading: false,
                title: Text('Choose Issues!',
                    style:
                    TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                centerTitle: true,
                leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 25,
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (_) => PromotersLogin()))))));
  }
}
