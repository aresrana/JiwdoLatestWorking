

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class PromoUser {
 String email;
String password;
   String phonenumber;
  String churchname;
  String churchaddress;
  String useraddress;
  String name;
    // ignore: non_constant_identifier_names
  PromoUser(this.email, this.password,this.phonenumber,this.churchname,this.churchaddress,this.name,this.useraddress);

}

