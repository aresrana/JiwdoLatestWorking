import 'dart:io' as io;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:jiwdopani/services/networkHandler.dart';



class UpdateSubscribers extends StatefulWidget{
  @override
  _UpdateSubscribersState createState() => _UpdateSubscribersState();
  UpdateSubscribers({Key key}): super(key:key);

}

class _UpdateSubscribersState extends State<UpdateSubscribers> {
  DateTime _currentdate = new DateTime.now();
     Future<Null> _selectdate(BuildContext context) async{
    final DateTime _seldate=await showDatePicker(
        context:context,
        initialDate:_currentdate,
        firstDate:DateTime(1990),
        lastDate: DateTime(2029),
        builder:(context,child){
          return
            Theme(
            data: ThemeData(
              primarySwatch: Colors.indigo,
              primaryColor: Colors.indigo,
              accentColor: Colors.indigo
            ),

            child: SingleChildScrollView(

            child:child,

          )
            );

        }
      );
      if(_seldate!=null && _seldate!=_currentdate){
        setState(()
            {
              _currentdate=_seldate;
              print(_currentdate.toString());
            });
      }
    }

  final networkHandler = NetworkHandler();
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _church = TextEditingController();
  TextEditingController _church_address = TextEditingController();
  TextEditingController _user_address = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _subscriber = TextEditingController();

  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text("Add Subscriber",
                style: TextStyle
                  (color: Colors.white,
                    fontWeight: FontWeight.bold),),

              backgroundColor: Colors.indigo[900],
            ),
            body: Form(
                key: _globalkey,
                child: ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      phoneTextField(),
                      SizedBox(
                        height: 10,
                      ),
                      nameTextField(),
                      SizedBox(
                        height: 10,
                      ),
                      emailTextField(),
                      SizedBox(
                        height: 10,
                      ),
                      churchTextField(),
                      SizedBox(
                        height: 10,
                      ),
                      churchAddressTextField(),
                      SizedBox(
                        height: 10,
                      ),
                      userAddressTextField(),
                      SizedBox(
                        height: 10,
                      ),
                      userJoinedDateField(context),
                      SizedBox(
                        height: 10,
                      ),

                      InkWell(
                          onTap: () async {
                            if (_globalkey.currentState.validate()) {
                              Map<String, String>data = {
                                "name": _name.text,
                                "email": _email.text,
                                "church": _church.text,
                                "church_address": _church_address.text,
                                "user_address": _user_address.text,
                                "contact": _contact.text
                              };
                              var response = await networkHandler.post(
                                  "/adduser", data);
                              print(response.statusCode);
                            }
                          },
                          child: Center(
                              child: Container(
                                  width: 150,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.indigo[900],
                                      borderRadius: BorderRadius.circular(10)

                                  ),
                                  child: Center(
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                  )
                              )

                          )
                      )
                    ]
                )
            )
        )
    );
  }


  Widget phoneTextField() {
    return TextFormField(
      controller: _contact,
      validator: (value) {
        if (value.isEmpty) return ("Phone Number can't be empty");
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(

              borderSide: BorderSide(
                // color: Colors.indigo,
                // width: 2,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.indigo,
                  width: 2
              )
          ),
          prefixIcon: Icon(Icons.phone,
              color: Colors.indigo[900]
          ),
          labelText: "Phone Number",
          hintText: "+917827319916"
      ),
    );
  }

  Widget nameTextField() {
    return TextFormField(
      controller: _name,
      validator: (value) {
        if (value.isEmpty) return ("Name can't be empty");
      },
      decoration: InputDecoration(
        // border: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       color: Colors.indigo,
        //       width: 2,
        //     )
        // ),
        // focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //         color: Colors.indigo,
        //        // width: 2
        //     )
        // ),
          prefixIcon: Icon(Icons.drive_file_rename_outline,
              color: Colors.indigo[900]
          ),
          labelText: "Name",
          hintText: "Ashish Rana Magar"
      ),
    );
  }

  Widget emailTextField() {
    return TextFormField(
      controller: _email,
      validator: (value) {
        if (value.isEmpty) return ("Email can't be empty");
      },
      decoration: InputDecoration(
        // border: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       color: Colors.indigo,
        //       width: 2,
        //     )
        // ),
        // focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //         color: Colors.indigo,
        //         width: 2
        //     )
        // ),
          prefixIcon: Icon(Icons.email,
              color: Colors.indigo[900]
          ),
          labelText: "Email",
          hintText: "aresnov3@gmail.com"
      ),
    );
  }

  Widget churchTextField() {
    return TextFormField(
      controller: _church,
      validator: (value) {
        if (value.isEmpty) return ("Church can't be empty");
      },
      decoration: InputDecoration(
        // border: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       color: Colors.indigo,
        //       width: 2,
        //     )
        // ),
        // focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //         color: Colors.indigo,
        //         width: 2
        //     )
        // ),
          prefixIcon: Icon(Icons.home,
              color: Colors.indigo[900]
          ),
          labelText: "Church",
          hintText: "Canan Prayer House"
      ),
    );
  }

  Widget churchAddressTextField() {
    return TextFormField(
      controller: _church_address,
      validator: (value) {
        if (value.isEmpty) return ("Church Address can't be empty");
      },
      decoration: InputDecoration(
        // border: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       color: Colors.indigo,
        //       width: 2,
        //     )
        // ),
        // focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //         color: Colors.indigo,
        //         width: 2
        //     )
        // ),
          prefixIcon: Icon(Icons.map,
              color: Colors.indigo[900]
          ),
          labelText: "Church Address",
          hintText: "New Baneswor,Kathmandu,Nepal"
      ),
    );
  }

  Widget userAddressTextField() {
    return TextFormField(
      controller: _user_address,
      validator: (value) {
        if (value.isEmpty) return ("User Address can't be empty");
      },
      decoration: InputDecoration(
        // border: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       color: Colors.indigo,
        //       width: 2,
        //     )
        // ),
        // focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //         color: Colors.indigo,
        //         width: 2
        //     )
        // ),
          prefixIcon: Icon(Icons.home_filled,
              color: Colors.indigo[900]
          ),
          labelText: "User Address",
          hintText: "Samakhushi,Kathmandu,Nepal"
      ),
    );
  }

  Widget userJoinedDateField(context) {
    String _formatteddate=new DateFormat.yMMMd().format(_currentdate);
    String getvalue;
    return TextFormField(
        controller: _subscriber,
      decoration: InputDecoration(
                 prefixIcon:IconButton(onPressed:(){
                   setState(() {

                    _selectdate(context);
                   });


                   },
                   icon:Icon(
                   Icons.date_range_sharp,
                   color: Colors.indigo[900],)
                 ),
              labelText:'Date of Subscription',
              hintText: "$_formatteddate",
      ),

    );

  }
}


