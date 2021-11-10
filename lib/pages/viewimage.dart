import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewImage extends StatefulWidget {
  var file;
  final String message;

  ViewImage(this.file,this.message );
  @override
  _ViewImageState createState() => _ViewImageState();
}


class _ViewImageState extends State<ViewImage> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(height / 20),
            child: InkWell(

              child: Text("View ${widget.message}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold)),
            ),
          ),

         Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [

                  Container(
                    height: height / 2,
                    child: widget.message=="pdf"?SfPdfViewer.file(
                      widget.file
                    ):widget.message=="image"?Image.file(widget.file):Container(),
                  ),
                ],
              ),
            ),

        ],
      ),
    );
  }
}
