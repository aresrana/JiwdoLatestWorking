import 'dart:io' as io;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:jiwdopani/services/networkHandler.dart';


class Profile extends StatefulWidget{
  @override
  _ProfileState createState() => _ProfileState();
  Profile({Key key}): super(key:key);

}

class _ProfileState extends State<Profile> {
  final networkHandler= NetworkHandler();
  final _globalkey=GlobalKey<FormState>();
  TextEditingController _name= TextEditingController();
  TextEditingController _email= TextEditingController();
  TextEditingController _church= TextEditingController();
  TextEditingController _church_address= TextEditingController();
  TextEditingController _user_address= TextEditingController();
  TextEditingController _contact= TextEditingController();
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text("Profile Page",
                style: TextStyle
                  (color: Colors.white,
                    fontWeight: FontWeight.bold),),

              backgroundColor: Colors.indigo[900],
            ),
            body:Form(
                key: _globalkey,
                child: ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    children: <Widget>[
                      imageProfile(),
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
                      phoneTextField(),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          onTap:() async {
                            if (_globalkey.currentState.validate())
                            {
                              Map<String,String>data={
                                "name":_name.text,
                                "email":_email.text,
                                "church":_church.text,
                                "church_address":_church_address.text,
                                "user_address":_user_address.text,
                                "contact":_contact.text
                              };
                              var response=await networkHandler.post("/adduser",data);
                              print(response.statusCode);
                            }
                          },
                          child:Center(
                              child: Container(
                                  width:150,
                                  height:40,
                                  decoration: BoxDecoration(
                                      color:Colors.indigo[900],
                                      borderRadius: BorderRadius.circular(10)

                                  ),
                                  child:Center(
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                          color:Colors.white,
                                          fontSize:15,
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

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Widget imageProfile() {
    return Center(
        child: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.blueGrey,
                backgroundImage:_imageFile==null?
                AssetImage("assets/prologo.png")
                    :FileImage(
                    io.File (_imageFile.path)

                ),
              ),
              Positioned(
                  bottom: -5,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: ((builder) => bottomSheet()),
                      );
                    },
                    child: Icon(
                        Icons.camera_alt,
                        color: Colors.indigo[900].withOpacity(0.5),
                        size: 28
                    ),
                  )
              ),
            ]
        )
    );
  }

  Widget bottomSheet() {
    return Container(
        height: 100,
        width: MediaQuery
            .of(context)
            .size
            .width,
        margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20
        ),
        child: Column(
            children: <Widget>[
              Text(
                "Please Choose a photo",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>
                [
                  FlatButton.icon(
                    icon: Icon(Icons.camera),
                    onPressed: () {
                      takePhoto(ImageSource.camera);
                    },
                    label: Text("Camera"),
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.image),
                    onPressed: () {
                      takePhoto(ImageSource.gallery);
                    },
                    label: Text("Galary"),
                  )
                ],
              )
            ]
        )
    );
  }


  Widget nameTextField() {
    return TextFormField(
      controller: _name,
      validator:(value){
        if (value.isEmpty) return ("Name can't be empty");
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.indigo,
                width: 2,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.indigo,
                  width: 2
              )
          ),
          prefixIcon: Icon(Icons.person,
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
      validator:(value){
        if (value.isEmpty) return ("Email can't be empty");
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.indigo,
                width: 2,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.indigo,
                  width: 2
              )
          ),
          prefixIcon: Icon(Icons.person,
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
      validator:(value){
        if (value.isEmpty) return ("Church can't be empty");
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.indigo,
                width: 2,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.indigo,
                  width: 2
              )
          ),
          prefixIcon: Icon(Icons.person,
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
      validator:(value){
        if (value.isEmpty) return ("Church Address can't be empty");
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.indigo,
                width: 2,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.indigo,
                  width: 2
              )
          ),
          prefixIcon: Icon(Icons.person,
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
      validator:(value){
        if (value.isEmpty) return ("User Address can't be empty");
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.indigo,
                width: 2,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.indigo,
                  width: 2
              )
          ),
          prefixIcon: Icon(Icons.person,
              color: Colors.indigo[900]
          ),
          labelText: "User Address",
          hintText: "Samakhushi,Kathmandu,Nepal"
      ),
    );
  }

  Widget phoneTextField() {
    return TextFormField(
      controller: _contact,
      validator:(value){
        if (value.isEmpty) return ("Phone Number can't be empty");
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.indigo,
                width: 2,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.indigo,
                  width: 2
              )
          ),
          prefixIcon: Icon(Icons.person,
              color: Colors.indigo[900]
          ),
          labelText: "Phone Number",
          hintText: "+917827319916"
      ),
    );
  }
}




