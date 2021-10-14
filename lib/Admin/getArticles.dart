
import 'package:jiwdopani/Admin/menuAdmin.dart';
import 'package:jiwdopani/Precious/firebase_file.dart';
import 'package:jiwdopani/UserMenuOption/read_option.dart';
import 'package:jiwdopani/Precious/file_page.dart';
import 'package:jiwdopani/Precious/preApi.dart';
import 'package:jiwdopani/Precious/firebase_file.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
GetArticles() => MyApp();

class MyApp extends StatelessWidget {
  static final String title = 'List of Submitted Articles';

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
    futureFiles = preApi.listAll('articles/');
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
                            builder: (context) => menuAdmin())))),
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

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildHeader(files.length),
                          const SizedBox(height: 12),
                          Expanded(
                            child: ListView.builder(
                              itemCount: files.length,
                              itemBuilder: (context, index) {
                                final file = files[index];
                                return buildFile(context, file);
                              },
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
          file.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        onTap: () {
          final isImg = ['jpg', 'JPG', 'png', 'PNG', 'jpeg', 'JPEG'];
          if (file.name.endsWith('.pdf')) {
            print('PDF ===>${file.name}');
            print('URL ===>${file.url}');
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FilePage(file: file),
            ));
          } else if (isImg.contains(file.name.split('.')[1])) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FilePage(
                file: file,
                isImage: true,
              ),
            ));
          }
        }),
  );

  Widget buildHeader(int length) => ListTile(
    tileColor: Colors.indigo[900],
    leading: Container(
      width: 52,
      height: 52,
      child: Icon(
        Icons.file_copy,
        color: Colors.white,
      ),
    ),
    title: Text(
      '$length Files',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
  );
}
