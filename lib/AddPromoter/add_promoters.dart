import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddPromoters extends StatefulWidget {
  @override
  _AddPromotersState createState() => _AddPromotersState();
}

class _AddPromotersState extends State<AddPromoters> {
  TextEditingController _nameController, _numberController;
  String _typeSelected ='';

  DatabaseReference _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Promoters');
  }


  Widget _buildContactType(String title){

    return InkWell(

      child: Container(
        height: 40,
        width: 90,

        decoration: BoxDecoration(
          color: _typeSelected == title? Colors.green : Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(15),
        ),

        child: Center(child: Text(title, style: TextStyle(fontSize: 18,
            color: Colors.white),
        ),),),

      onTap: (){
        setState(() {
          _typeSelected = title;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text('Save Promoters'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter Name',
                prefixIcon: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _numberController,
              decoration: InputDecoration(
                hintText: 'Enter Number',
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            //SizedBox(height: 15,),
           SizedBox(height: 25,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: RaisedButton (
                color:Colors.indigo[900],

                child: Text('Save Promoter',style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,

              ),),
                onPressed: () {
                  savePromoters();
                },
                //color: Theme.of(context).primaryColor,
              ),
            )

          ],
        ),
      ),
    );
  }
  void savePromoters(){

    String name = _nameController.text;
    String number = _numberController.text;
    if((name.isEmpty) || (number.isEmpty)){
      print('no data');
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Please Enter Both Of The Fields'),
          duration: Duration(seconds: 3)));
    }
    else
    {
      Map<String, String> subscribers = {
        'name': name,
        'number': number,
      };

      _ref.push().set(subscribers).then((value) {
        Navigator.pop(context);
      });
    }

  }
}