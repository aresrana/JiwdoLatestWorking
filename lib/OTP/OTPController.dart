import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:jiwdopani/JiudoPani/JiudoLatest.dart';
import 'package:jiwdopani/Subscribers/subscribers.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'homeScreen.dart';

class OTPController extends StatefulWidget {
  final String phoneNumber;
  final String codeDigit;

  OTPController({this.phoneNumber, this.codeDigit});
  @override
  _OTPControllerState createState() => _OTPControllerState();
}

class _OTPControllerState extends State<OTPController> {
  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }

  final GlobalKey<ScaffoldState> _scafoldkey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinOTPCodeController = TextEditingController();
  final FocusNode _pinOTPFocus = FocusNode();
  String verificationcode;
  final BoxDecoration pinOTPCodeDecoration = BoxDecoration(
      color: Colors.indigo[900],
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: Colors.grey,
      ));

  verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "${widget.codeDigit + widget.phoneNumber}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value != null) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (c) => JiudoLatest()));
          }
        });
      },
      verificationFailed: (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Invalid OTP'), duration: Duration(seconds: 3)));
      },
      codeSent: (String vID, int resendToken) {
        setState(() {
          verificationcode = vID;
        });
      },
      codeAutoRetrievalTimeout: (String vID) {
        setState(() {
          verificationcode = vID;
        });
      },
      timeout: Duration(seconds: 60),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scafoldkey,
        appBar: AppBar(
          title: Text('OTP Verification'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/otp.png"),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Center(
                    child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Verifying your number :${widget.codeDigit}-${widget.phoneNumber}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )))),
            Padding(
                padding: EdgeInsets.all(40),
                child: PinPut(
                  fieldsCount: 6,
                  textStyle: TextStyle(fontSize: 25.0, color: Colors.white),
                  eachFieldWidth: 40.0,
                  eachFieldHeight: 55.0,
                  focusNode: _pinOTPFocus,
                  controller: _pinOTPCodeController,
                  submittedFieldDecoration: pinOTPCodeDecoration,
                  selectedFieldDecoration: pinOTPCodeDecoration,
                  followingFieldDecoration: pinOTPCodeDecoration,
                  pinAnimationType: PinAnimationType.rotation,
                  onSubmit: (pin) async {
                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: verificationcode, smsCode: pin))
                          .then((value) {
                        if (value != null) {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (c) => JiudoLatest()));
                        }
                      });
                    } catch (e) {
                      FocusScope.of(context).unfocus();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Invalid OTP'),
                          duration: Duration(seconds: 3)));
                    }
                  },
                ))
          ],
        ));
  }
}
