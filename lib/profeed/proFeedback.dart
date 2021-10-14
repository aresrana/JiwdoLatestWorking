import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ProFeedback extends StatefulWidget {
  @override
  _ProFeedbackState createState() => _ProFeedbackState();
}

class _ProFeedbackState extends State<ProFeedback> {
  TextEditingController _name, _feedback;


  DatabaseReference _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _name = TextEditingController();
    _feedback = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Feedback');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text('Submit Feedback'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height:200,
                child: Stack(
                  children:<Widget> [
                    TextField(
                      controller: _feedback,
                      maxLines: 50,
                      decoration: InputDecoration(
                          hintText: "Any suggestions are appreciated",
                          hintStyle: TextStyle(
                              fontSize:13.0,
                              color:Color(0xffc5c5c5)
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color:Colors.indigo[900]),
                          )

                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child:Container(
                          // decoration: BoxDecoration(
                          //   border: Border(
                          //       top: BorderSide(
                          //         width: 1.0,
                          //         color:Colors.indigo[900],
                          //       )
                          //   ),
                          //
                          // ),
                            padding: EdgeInsets.all(0),
                            child: Row(
                              children:<Widget> [
                                Container(
                                  decoration:BoxDecoration(
                                    //color: Colors.indigo[900],
                                    //borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    //child: Icon(Icons.add,color:Color(0xffa5a5a5),
                                  ),
                                ),

                              ],
                            )
                        )
                    )

                  ],
                )
            ),
            SizedBox(
                height:10
            ),

            TextField(
              controller: _name,
              style:TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0.0),
                prefixIcon:Row(
                  mainAxisSize: MainAxisSize.min,
                  children:<Widget> [
                    Container(
                      decoration: BoxDecoration(border:Border(
                          right: BorderSide(width:1.0,color:Colors.indigo[900])
                      ),

                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children:<Widget> [
                          SizedBox(width:10.0),
                          Text("Your Fullname",
                              style:TextStyle(
                                fontWeight:FontWeight.bold,
                                color: Color(0xffc5c5c5),
                              )
                          ),
                          SizedBox(width:10.0),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0)
                  ],
                ),
                hintStyle: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xffc5c5c5),
                ),
                hintText: "Ashish Rana Magar",
                border: OutlineInputBorder(),
              ),
            ),
            //SizedBox(height: 15,),
            SizedBox(height: 25,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: RaisedButton(child: Text('Submit',style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,

              ),),
                  onPressed: (){
                    saveFeedback();
                  },

                  color: Colors.indigo[900]
              ),
            )

          ],
        ),
      ),
    );
  }
  void saveFeedback(){


    String name = _name.text;
    String feedback = _feedback.text;
    if((name.isEmpty) || (feedback.isEmpty)){
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Please Enter Both Of The Fields'),
          duration: Duration(seconds: 3)));
    }
    else
    {
      Map<String, String> feedbacks = {
        'name': name,
        'feedback': feedback,
      };

      _ref.push().set(feedbacks).then((value) {
        _name.clear();
        _feedback.clear();
        FocusScope.of(context).unfocus();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Submitted Successully'),
            duration: Duration(seconds: 3)));
      });
    }

  }
}