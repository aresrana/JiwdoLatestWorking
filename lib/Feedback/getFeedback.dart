import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GetFeedback extends StatefulWidget {
  @override
  _GetFeedbackState createState() => _GetFeedbackState();
}

class _GetFeedbackState extends State<GetFeedback> {
  Query _ref;
  DatabaseReference reference =
  FirebaseDatabase.instance.reference().child('Feedback');



  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    _ref = FirebaseDatabase.instance
        .reference()
        .child('Feedback')
        .orderByChild('name');


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Text('Daily Promise Archive', textAlign: TextAlign.center,),
        ),
        body:Container(
            height: double.infinity,
            child: FirebaseAnimatedList(
                query: _ref,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map readFeedback = snapshot.value;
                  readFeedback['key'] = snapshot.key;
                  return _buildContactItem(getFeedback: readFeedback);
                })
        )
    );
  }
}

Widget _buildContactItem({getFeedback}) {
  return Container(

      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 130,
      color: Colors.white,
      child: Container(


          child: Card(
              color: Colors.indigo,
              shadowColor: Colors.black,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          getFeedback['name'],
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          getFeedback['feedback'],
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                                            ],
                    )
                  ]
              )

          )));


}







