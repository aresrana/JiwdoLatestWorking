
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:jiwdopani/Precious/firebase_file.dart';



class ProFilePage extends StatefulWidget {
  const ProFilePage({this.file, this.isImage = false});
  final FirebaseFile file;
  final isImage;
  @override
  _ProFilePageState createState() => _ProFilePageState();
}

class _ProFilePageState extends State<ProFilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //initState(){
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Text(widget.file.name.split('.').first),
          centerTitle: true,
        ),
        body: widget.isImage
            ? loadImage(widget.file.url)
            : FutureBuilder(
                future: PDFDocument.fromURL(widget.file.url),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      var pdf = snapshot.data as PDFDocument;
                      return PDFViewer(document: pdf);
                  }
                }),
      ),
    );
  }

  Widget loadImage(String url) {
    return Image.network(
      url,
      loadingBuilder: (context, widget, event) {
        if (event == null) return widget;
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 20,
              ),
              Text('Loading')
            ],
          ),
        );
      },
    );
  }
}
            // body: isPdf
            //     ? PdfView(
            //         path: this.file.url,
            //         //   nightMode:true,
            //         //  pageSnap:true,
            //         //   onError:(e){
            //         //      print(e);
            //         //   },
            //         //   onRender: (_pages){
            //         //      _totalPages=_pages;
            //         //      pdfReady=true;
            //         //
            //         // },
            //         //   onViewCreated:(PDFViewController vc){
            //         //      _pdfViewController =vc;
            //         //                    },
            //         //   onPageChanged: (int page,int total){
            //         //
            //         //
            //         //   }
            //       )
            //     : isImg
            //         ? Image.network(
            //             this.file.url,
            //             height: double.infinity,
            //             fit: BoxFit.cover,
            //           )
            //         : Center(child: Text('Sorry for the inconvenience!!'))));
  
