import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jiwdopani/Precious/firebase_file.dart';
import 'package:jiwdopani/UserMenuOption/read_option.dart';
import 'package:jiwdopani/Precious/file_page.dart';
import 'package:jiwdopani/Precious/preApi.dart';
import 'package:jiwdopani/Precious/firebase_file.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'breadMain.dart';
import 'englishMain.dart';

// ignore: non_constant_identifier_names
EnglishArchive() => MyApp();

class MyApp extends StatelessWidget {
  static final String title = 'Daily Bread';

  @override
  Widget build(context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    //color: Colors.indigo[900],
    home: MainPage(),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<List<FirebaseFile>> futureFiles;


  @override
  void initState() {
    super.initState();
    futureFiles = preApi.listAll('EnglishBread/');
  }

  @override
  Widget build(context) => SafeArea(
      child: WillPopScope(
          onWillPop: () => Future.value(false),
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.indigo[900],
                title: Text(MyApp.title),
                centerTitle: true,
                automaticallyImplyLeading: false,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () async => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BreadMain())))),
            body: FutureBuilder<List<FirebaseFile>>(
              future: futureFiles,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasError) {
                      return Center(child: Text('Some error occurred!'));
                    } else {

                      final files = snapshot.data;

                      List fileFiltered=[];

                      //itemCount: files.length,
                      for(var i=0;i<files.length;i++){
                        var file=files[i];


                        final DateTime now=DateTime.now();
                        final DateFormat formatter=DateFormat("dd MMMM yyyy");
                        String today=formatter.format(now);
                        DateTime currentDate = new DateFormat("dd MMMM yyyy").parse(today);
                        var b=file.name.split('.').first;
                        DateTime fileDate = new DateFormat("dd MMMM yyyy").parse(b);
                        if (fileDate.isBefore(currentDate)){

                          fileFiltered.add(file);

                          //buildFile(context,file);

                        }

                      }
                      print(fileFiltered);




                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          //buildHeader(files.length),
                          const SizedBox(height: 12),
                          Expanded(

                            child: ListView.builder(
                                itemCount: fileFiltered.length,
                                itemBuilder: (context, index) {
                                  final file = fileFiltered[index];
                                    return buildFile(context,file);

                                }
                                  //else
                                   // return null;

                            ),
                          ),
                        ],
                      );
                    }
                }
              },
            ),
          )));

  Widget buildFile(context, FirebaseFile file) => Card(

    child: ListTile(

        title: Text(
          file.name.split('.').first,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FilePage(file: file),
            ));
  }));

  }


