import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jiwdopani/UserLogIn/MenuUse.dart';
import 'OTPController.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String dialCodeDigits = "+977";
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(height: 100),
      Padding(
        padding: const EdgeInsets.only(left: 28.0, right: 28.0),
        child: Image.asset("assets/prologolast.jpg",
        fit: BoxFit.scaleDown),
      ),
      Container(
        margin: EdgeInsets.only(top: 10),
        child: Center(
            child: Text(
          "Phone (OTP) Authentication",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color:Color(0xff9C050D)),
        )),
      ),
      SizedBox(
        height: 50,
      ),
      SizedBox(
        height: 60,
        width: 400,
        child: CountryCodePicker(
          onChanged: (country) {
            setState(() {
              dialCodeDigits = country.dialCode;
            });
          },
          initialSelection: "नेपाल",
          showCountryOnly: false,
          showOnlyCountryWhenClosed: false,
          favorite: ["+91", "IND", "+1", "USA","+977","नेपाल"],
        ),
      ),
      Container(
          margin: EdgeInsets.only(top: 10, right: 10, left: 10),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Phone Number",
                prefix: Padding(
                  padding: EdgeInsets.all(4),
                  child: Text(dialCodeDigits),
                )),
            maxLength: 12,
            keyboardType: TextInputType.number,
            controller: _controller,
          )),
      Container(
          margin: EdgeInsets.all(15),
          width: double.infinity,
          child: ElevatedButton(
              style:ElevatedButton.styleFrom(primary: Color(0xff9C050D)),
              onPressed: () async {
                if (_controller.text.isEmpty) {
                  return;
                }

                var numberPhone = dialCodeDigits + _controller.text;

                var data = await FirebaseDatabase.instance
                    .reference()
                    .child('Subscribers')
                    .orderByChild('number')
                    .equalTo(numberPhone)
                    .once();

                if (data.value==null) {
                  FocusScope.of(context).unfocus();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please contact your promoter for subscription'),
                      duration: Duration(seconds: 3)));
                     _controller.clear();

                        return;



                  // await showDialog(
                  //     context: context,
                  //     builder: (_) => AlertDialog(
                  //             title: Text(
                  //               'Sorry!',
                  //               style: TextStyle(color: Colors.red),
                  //             ),
                  //             content: Text(
                  //               "You are not subscribed to us. Please do contact your promoter  ",
                  //               style: TextStyle(color: Colors.indigo[900]),
                  //             ),
                  //             actions: [
                  //               // ignore: deprecated_member_use
                  //               FlatButton(
                  //                   child: Text('Try Again'),
                  //                   onPressed: () {
                  //                     Navigator.of(context).pop();
                  //                   }),
                  //               // ignore: deprecated_member_use
                  //             ]));
                  // return;
                }
                {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (c) => OTPController(
                        phoneNumber: _controller.text,
                        codeDigit: dialCodeDigits)));
              }},
              child: Text(
                'Next',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))),

                  ElevatedButton(
                      style:ElevatedButton.styleFrom(primary: Color(0xff9C050D)),

                      onPressed:(

                          ){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserMenu()
                            )
                        );
                      },
                      child: Text(
                        'Back',
                        style:
                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      )

                  ),
    ])));
  }
}
