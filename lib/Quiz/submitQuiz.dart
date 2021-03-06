import 'dart:io' show File, Platform;
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jiwdopani/UserMenuOption/user_submit.dart';
import 'firebase_api.dart';
import 'button_widget.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

// ignore: non_constant_identifier_names

class SubmitQuiz extends StatefulWidget {
  @override
  _SubmitQuizState createState() => _SubmitQuizState();
}

class _SubmitQuizState extends State<SubmitQuiz> {
  UploadTask task;
  File file;

  @override
  Widget build(context) {
    final fileName = file != null ? basename(file.path) : 'No File Selected';
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
              title: Text('Please Upload Your Quiz  Answers'),
              centerTitle: true,
              backgroundColor: Colors.indigo[900],
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                          builder: (context) => UserSubmitOption())))),
          body: Container(
            padding: EdgeInsets.all(32),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget(
                    text: 'Select File',
                    icon: Icons.attach_file,
                    onClicked: selectFile,
                  ),
                  SizedBox(height: 8),
                  Text(
                    fileName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 48),
                  ButtonWidget(
                    text: 'Upload File',
                    icon: Icons.cloud_upload_outlined,
                    onClicked: uploadFile,
                  ),
                  SizedBox(height: 20),
                  task != null ? buildUploadStatus(task) : Container(),
                ],
              ),
            ),
          ),
        ));
  }

  selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    future:
    if (result == null) return;
    final path = result.files.single.path;

    setState(() => file = File(path));
  }

  uploadFile() async {
    future:
    if (file == null) return;

    final fileName = basename(file.path);
    final destination = 'quiz/$fileName';

    task = FirebaseApi.uploadFile(destination, file);
    setState(() {});

    future:
    if (task == null) return;

    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          future:
          if (snapshot.hasData) {
            final snap = snapshot.data;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}
