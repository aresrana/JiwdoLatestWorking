import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jiwdopani/Subscribers/subscribers.dart';
import 'package:jiwdopani/UserLogIn/MenuUse.dart';
import 'ProOtpController.dart';

class CheckPromo extends StatefulWidget {
  const CheckPromo({Key key}) : super(key: key);

  @override
  _CheckPromoState createState() => _CheckPromoState();
}

class _CheckPromoState extends State<CheckPromo> {
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
                      "Aunthenticating Access",
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
                  margin: EdgeInsets.all(5),
                  width: double.infinity,
                  child: ElevatedButton(
                      style:ElevatedButton.styleFrom(primary: Color(0xff9C050D)),
                      onPressed: () async {
                        if (_controller.text.isEmpty) {
                          FocusScope.of(context).unfocus();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Please Enter Your Number'),
                              duration: Duration(seconds: 3)));

                        }

                        var numberPhone = dialCodeDigits + _controller.text;

                        var data = await FirebaseDatabase.instance
                            .reference()
                            .child('Promoters')
                            .orderByChild('number')
                            .equalTo(numberPhone)
                            .once();

                        if (data.value==null) {

                          FocusScope.of(context).unfocus();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('We could not verify you.Please Contact Admin!'),
                              duration: Duration(seconds: 3)));

                                    _controller.clear();

                                                    return;
                        }
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (c) => ProOtpController(
                                phoneNumber: _controller.text,
                                codeDigit: dialCodeDigits)));
                      },
                      child: Text(
                        'Next',
                        style:
                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ))),

              ElevatedButton(
                style:ElevatedButton.styleFrom(primary: Color(0xff9C050D)),

                  onPressed:(

                  ){
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => UserMenu()),
                            (Route<dynamic> route) => false);

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
