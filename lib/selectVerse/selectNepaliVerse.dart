import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiwdopani/Admin/menuAdmin.dart';
import 'package:jiwdopani/Admin/verseModel.dart';
import 'ExpandedListAnimationWidget.dart';
import 'Scrollbar.dart';
import 'package:http/http.dart' as http;

class GetNepaliVerse extends StatefulWidget {
  @override
  _GetNepaliVerseState createState() => _GetNepaliVerseState();
}

List<String> _book = [
'उत्पत्ति','प्रस्थान','लेवी','गन्ती','व्यवस्था','यहोशू','न्यायकर्ता','रूथ','१ शमूएल','२ शमूएल','१ राजा','२ राजा','१ इतिहास','२ इतिहास','एज्रा','नहेम्याह','एस्तर','अय्यूब','भजनसंग्रह','हितोपदेश','उपदेशक','श्रेष्ठगीत','यशैया','यर्मिया','विलाप',
'इजकिएल','दानियल','होशे','योएल',
'आमोस','ओबदिया','योना','मीका','नहूम','हबकूक','सपन्याह','हाग्गै','जकरिया','मलाकी','मत्ती','मर्कूस','लूका','यूहन्ना',
'प्रेरित','रोमी','१ कोरिन्थी','२ कोरिन्थी','गलाती','एफिसी','फिलिप्पी','कलस्सी','१ थेस्सलोनिकी','२ थेस्सलोनिकी','१ तिमोथी','२ तिमोथी','तीतस','फिलेमोन','हिब्रू','याकूब','१ पत्रुस','२ पत्रुस','१ यूहन्ना','२ यूहन्ना','३ यूहन्ना','यहूदा','प्रकाश'
];
List<String> _chapter = [
  '१',
  '२',
  '३',
  '४',
  '५',
  '६',
  '७',
  '८',
  '९',
  '१०',
  '११',
  '१२',
  '१३',
  '१४',
  '१५',
  '१६',
  '१७',
  '१८',
  '१९',
  '२०',
  '२१',
  '२२',
  '२३',
  '२४',
  '२५',
  '२६',
  '२७',
  '२८',
  '२९',
  '३०',
  '३१',
  '३२',
  '३३',
  '३४',
  '३५',
  '३६',
  '३७',
  '३८',
  '३९',
  '४०',
  '४१',
  '४२',
  '४३',
  '४४',
  '४५',
  '४६',
  '४७',
  '४८',
  '४९',
  '५०',
  '५१',
  '५२',
  '५३',
  '५४',
  '५५',
  '५६',
  '५७',
  '५८',
  '५९',
  '६०',
  '६१',
  '६२',
  '६३',
  '६४',
  '६५',
  '६६',
  '६७',
  '६८',
  '६९',
  '७०',
  '७१',
  '७२',
  '७३',
  '७४',
  '७५',
  '७६',
  '७७',
  '७८',
  '७९',
  '८०',
  '८१',
  '८२',
  '८३',
  '८४',
  '८५',
  '८६',
  '८७',
  '८८',
  '८९',
  '९०',
  '९१',
  '९२',
  '९३',
  '९४',
  '९५',
  '९६',
  '९७',
  '९८',
  '९९',
  '१००',
  '१०१',
  '१०२',
  '१०३',
  '१०४',
  '१०५',
  '१०६',
  '१०७',
  '१०८',
  '१०९',
  '११०',
  '१११',
  '११२',
  '११३',
  '११४',
  '११५',
  '११६',
  '११७',
  '११८',
  '११९',
  '१२०',
  '१२१',
  '१२२',
  '१२३',
  '१२४',
  '१२५',
  '१२६',
  '१२७',
  '१२८',
  '१२९',
  '१३०',
  '१३१',
  '१३२',
  '१३३',
  '१३४',
  '१३५',
  '१३६',
  '१३७',
  '१३८',
  '१३९',
  '१४०',
  '१४१',
  '१४२',
  '१४३',
  '१४४',
  '१४५',
  '१४६',
  '१४७',
  '१४८',
  '१४९',
  '१५०'
];
List<String> _verse = [
  '१',
  '२',
  '३',
  '४',
  '५',
  '६',
  '७',
  '८',
  '९',
  '१०',
  '११',
  '१२',
  '१३',
  '१४',
  '१५',
  '१६',
  '१७',
  '१८',
  '१९',
  '२०',
  '२१',
  '२२',
  '२३',
  '२४',
  '२५',
  '२६',
  '२७',
  '२८',
  '२९',
  '३०',
  '३१',
  '३२',
  '३३',
  '३४',
  '३५',
  '३६',
  '३७',
  '३८',
  '३९',
  '४०',
  '४१',
  '४२',
  '४३',
  '४४',
  '४५',
  '४६',
  '४७',
  '४८',
  '४९',
  '५०',
  '५१',
  '५२',
  '५३',
  '५४',
  '५५',
  '५६',
  '५७',
  '५८',
  '५९',
  '६०',
  '६१',
  '६२',
  '६३',
  '६४',
  '६५',
  '६६',
  '६७',
  '६८',
  '६९',
  '७०',
  '७१',
  '७२',
  '७३',
  '७४',
  '७५',
  '७६',
  '७७',
  '७८',
  '७९',
  '८०',
  '८१',
  '८२',
  '८३',
  '८४',
  '८५',
  '८६',
  '८७',
  '८८',
  '८९',
  '९०',
  '९१',
  '९२',
  '९३',
  '९४',
  '९५',
  '९६',
  '९७',
  '९८',
  '९९',
  '१००',
  '१०१',
  '१०२',
  '१०३',
  '१०४',
  '१०५',
  '१०६',
  '१०७',
  '१०८',
  '१०९',
  '११०',
  '१११',
  '११२',
  '११३',
  '११४',
  '११५',
  '११६',
  '११७',
  '११८',
  '११९',
  '१२०',
  '१२१',
  '१२२',
  '१२३',
  '१२४',
  '१२५',
  '१२६',
  '१२७',
  '१२८',
  '१२९',
  '१३०',
  '१३१',
  '१३२',
  '१३३',
  '१३४',
  '१३५',
  '१३६',
  '१३७',
  '१३८',
  '१३९',
  '१४०',
  '१४१',
  '१४२',
  '१४३',
  '१४४',
  '१४५',
  '१४६',
  '१४७',
  '१४८',
  '१४९',
  '१५०',
  '१५१',
  '१५२',
  '१५३',
  '१५४',
  '१५५',
  '१५६',
  '१५७',
  '१५८',
  '१५९',
  '१६०',
  '१६१',
  '१६२',
  '१६३',
  '१६४',
  '१६५',
  '१६६',
  '१६७',
  '१६८',
  '१६९',
  '१७०',
  '१७१',
  '१७२',
  '१७३',
  '१७४',
  '१७५',
  '१७६',
  ];

class _GetNepaliVerseState extends State<GetNepaliVerse> {
  final DbRef = FirebaseDatabase.instance.reference();
  DatabaseReference _ref;
  Future<Verse> futureVerse;

  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child('Daily Promise Nepali');
  }

  String _dateTime;
  bool isStrechedGetVerseBook = false;
  bool isStrechedGetVerseChapter = false;
  bool isStrechedGetVerseVerse = false;

  TextEditingController ve = TextEditingController();
  String _typeVerse;
  String book;
  String ver;
  String chapter;
  int bookValue;
  int chapterValue;
  int verseValue;
  String Book = 'Select Book';
  String Chapter = 'Select Chapter';
  String Vers = 'Select Verse';
  final DateFormat formatter = DateFormat("dd MMMM yyyy");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () async => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => menuAdmin()))),
        backgroundColor: Colors.indigo[900],
        title: Text(
          "आजको निम्ति परमेश्वरको प्रतिज्ञा ",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        //backgroundColor: Colors.indigo[900],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      //child: Container(
                      //decoration: BoxDecoration(
                      //  border: Border.all(color: Color(0xffbbbbbb)),
                      //  borderRadius: BorderRadius.all(Radius.circular(27))),
                      child: Column(
                        children: [
                          Container(
                              height: 40,
                              width: double.infinity,
                              padding: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xffbbbbbb),
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                              constraints: BoxConstraints(
                                minHeight: 30,
                                minWidth: double.infinity,
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Text(
                                        Book,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isStrechedGetVerseBook =
                                          !isStrechedGetVerseBook;
                                          book;
                                        });
                                      },
                                      child: Icon(isStrechedGetVerseBook
                                          ? Icons.arrow_upward
                                          : Icons.arrow_downward))
                                ],
                              )),
                          ExpandedSection(
                            expand: isStrechedGetVerseBook,
                            height: 30,
                            child: MyScrollbar(
                              builder: (context, scrollController1) =>
                                  ListView.builder(
                                      padding: EdgeInsets.all(0),
                                      controller: scrollController1,
                                      shrinkWrap: true,
                                      itemCount: _book.length,
                                      itemBuilder: (context, index) {
                                        return RadioListTile(
                                            title: Text(_book.elementAt(index)),
                                            value: index,
                                            groupValue: bookValue,
                                            onChanged: (val) {
                                              setState(() {
                                                bookValue = val;
                                                book = _book.elementAt(index);
                                                Book = book;
                                              });
                                            });
                                      }),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //Text("Please Select Chapter"),
                          Container(
                              height: 40,
                              width: double.infinity,
                              padding: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xffbbbbbb),
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                              constraints: BoxConstraints(
                                minHeight: 30,
                                minWidth: double.infinity,
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Text(Chapter),
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isStrechedGetVerseChapter =
                                          !isStrechedGetVerseChapter;
                                          chapter;
                                        });
                                      },
                                      child: Icon(isStrechedGetVerseChapter
                                          ? Icons.arrow_upward
                                          : Icons.arrow_downward))
                                ],
                              )),
                          ExpandedSection(
                            expand: isStrechedGetVerseChapter,
                            height: 30,
                            child: MyScrollbar(
                              builder: (context, scrollController2) =>
                                  ListView.builder(
                                      padding: EdgeInsets.all(0),
                                      controller: scrollController2,
                                      shrinkWrap: true,
                                      itemCount: _chapter.length,
                                      itemBuilder: (context, index) {
                                        return RadioListTile(
                                            title:
                                            Text(_chapter.elementAt(index)),
                                            value: index,
                                            groupValue: chapterValue,
                                            onChanged: (chap) {
                                              setState(() {
                                                chapterValue = chap;
                                                chapter =
                                                    _chapter.elementAt(index);
                                                Chapter = chapter;
                                              });
                                            });
                                      }),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: 40,
                              width: double.infinity,
                              padding: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xffbbbbbb),
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                              constraints: BoxConstraints(
                                minHeight: 30,
                                minWidth: double.infinity,
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Text(Vers),
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isStrechedGetVerseVerse =
                                          !isStrechedGetVerseVerse;
                                          ver;
                                        });
                                      },
                                      child: Icon(isStrechedGetVerseVerse
                                          ? Icons.arrow_upward
                                          : Icons.arrow_downward))
                                ],
                              )),
                          ExpandedSection(
                            expand: isStrechedGetVerseVerse,
                            height: 30,
                            child: MyScrollbar(
                              builder: (context, scrollController3) =>
                                  ListView.builder(
                                      padding: EdgeInsets.all(0),
                                      controller: scrollController3,
                                      shrinkWrap: true,
                                      itemCount: _verse.length,
                                      itemBuilder: (context, index) {
                                        return RadioListTile(
                                            title:
                                            Text(_verse.elementAt(index)),
                                            value: index,
                                            groupValue: verseValue,
                                            onChanged: (verse) {
                                              setState(() {
                                                verseValue = verse;
                                                ver = _verse.elementAt(index);
                                                Vers = ver;
                                              });
                                            });
                                      }),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(_dateTime == null
                        ? 'Please select a date'
                        : _dateTime.toString()),
                    RaisedButton(
                      child: Text('Pick a date'),
                      onPressed: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2021),
                            lastDate: DateTime(2222))
                            .then((dates) {
                          setState(() {
                            // _dateTime=dates;
                            String formattedDate =
                            DateFormat('dd MMMM yyyy').format(dates);
                            _dateTime = formattedDate;
                          });
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                    height:20
                ),
                TextField(
                  controller: ve,
                  decoration:InputDecoration(
                    border :OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color:Colors.black)
                    ),
                    labelText: "Enter Promise Verse",
                    labelStyle: TextStyle(
                        fontSize: 15,
                        color:Colors.black
                    ),
                  ),
                ),


                // InkWell(
                //   onTap: () async {
                //             if (book == null ||
                //                 chapter == null ||
                //                 ver == null) {
                //               return showDialog(
                //                   context: context,
                //                   builder: (context) {
                //                     return AlertDialog(
                //                       title: Text('Warning! '),
                //                       content: Text(
                //                         'Please select any book,chapter and verse!',
                //                         style: TextStyle(
                //                             color: Colors.red),
                //                       ),
                //                       actions: [
                //                         FlatButton(
                //                             child: Text('Back'),
                //                             onPressed: () {
                //                               Navigator.push(context,
                //                                   MaterialPageRoute(
                //                                       builder:
                //                                           (BuildContext
                //                                       context) {
                //                                         return GetNepaliVerse();
                //                                       }));
                //                             }),
                //                       ],
                //                     );
                //                   });
                //             }
                //
                //
                //
                //   }
                //
                //
                // )

                FutureBuilder(
                    future: futureVerse,
                    builder: (context, snapshot) {
                      return Container(
                          child: FutureBuilder<Verse>(
                              future: futureVerse,
                              builder: (context, snapshot) {
                                return Container(
                                    padding: EdgeInsets.all(15),
                                    child: InkWell(
                                      child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius
                                                  .circular(5)
                                          ),
                                          elevation: 20,
                                          child: Text("Submit",
                                            style: TextStyle(fontSize: 15),)),
                                      onTap: () async {
                                        if (book == null ||
                                            chapter == null ||
                                            ver == null) {
                                          return showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text('Warning! '),
                                                  content: Text(
                                                    'Please select any book,chapter and verse!',
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                  actions: [
                                                    FlatButton(
                                                        child: Text('Back'),
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (
                                                                      BuildContext
                                                                      context) {
                                                                    return GetNepaliVerse();
                                                                  }));
                                                        }),
                                                  ],
                                                );
                                              });
                                        }
                                        {     return showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Add the following verse ?' +
                                                            book +
                                                            ' ' +
                                                            chapter +
                                                            ':' +
                                                            ver),
                                                    content: Text(
                                                      ve.text,
                                                      style: TextStyle(),
                                                    ),
                                                    actions: [
                                                      FlatButton(
                                                          child: Text('Submit'),
                                                          onPressed: () {
                                                            String ret = (book +
                                                                ' ' +
                                                                chapter +
                                                                ':' +
                                                                ver);
                                                            Map<String, String>
                                                            bible = {
                                                              'date': _dateTime,
                                                              'verse': ret,
                                                              'promise': ve.text
                                                            };
                                                            _ref.push().set(
                                                                bible);
                                                            FocusScope.of(
                                                                context)
                                                                .unfocus();
                                                            ScaffoldMessenger
                                                                .of(
                                                                context)
                                                                .showSnackBar(
                                                                SnackBar(
                                                                    content: Text(
                                                                        'Daily Promise Successfully Added'),
                                                                    duration:
                                                                    Duration(
                                                                        seconds:
                                                                        3)));
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (
                                                                        BuildContext
                                                                        context) {
                                                                      return GetNepaliVerse();
                                                                    }));
                                                          }),
                                                      FlatButton(
                                                          child: Text('Cancel'),
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (
                                                                        BuildContext
                                                                        context) {
                                                                      return GetNepaliVerse();
                                                                    }));
                                                          }
                                                      )

                                                    ],
                                                  );
                                                });
                                        }

                                        }
    ));
    },
                                    ));
                              }
                          )
                    ])))));}


  }


