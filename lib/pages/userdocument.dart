import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productbox_flutter_exercise/pages/viewimage.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Userdocument extends StatefulWidget {
  const Userdocument({Key? key}) : super(key: key);

  @override
  _UserdocumentState createState() => _UserdocumentState();
}

class _UserdocumentState extends State<Userdocument> {
  late PdfViewerController _pdfViewerController;
   bool buttonchecker = true;


  var imageFile;
  var drivinglicense;
   var Certificate;
  var Passport;

  @override
  void initState() {
    super.initState();
  }

  // final bool _isdiable = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    print("${drivinglicense}");
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: InkWell(child: Icon(Icons.arrow_back,color: Colors.white,), onTap: (){
                    Navigator.of(context).pop();
                  },),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(height / 20),
              child: Text("Upload Documents",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold)),
            ),
            pageIndicator(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            InkWell(
              onTap: () {
                ////BOTTOM SHEET//
              showModalBottomSheet(
                    context: context,
                    builder: (BuildContext bc) {
                      return Container(
                        child: new Wrap(
                          children: <Widget>[
                            new ListTile(
                                leading: new Icon(
                                  Icons.image,
                                  color: Colors.red,
                                ),
                                title: new Text(
                                  'Gallery',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () async {
                                  PickedFile? pickedFile =
                                      await ImagePicker().getImage(
                                    source: ImageSource.gallery,
                                    maxWidth: 1800,
                                    maxHeight: 1800,
                                  );

                                  if (pickedFile != null) {
                                    setState(() {

                                      imageFile = File(pickedFile.path);
                                    });
                                  }
                                }),
                            new ListTile(
                              leading: new Icon(
                                Icons.camera,
                                color: Colors.green,
                              ),
                              title: new Text(
                                'Camera',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              onTap: () async {
                                FilePickerResult? pickedFile =
                                    await FilePicker.platform.pickFiles(
                                    type: FileType.custom,allowedExtensions: ['jpeg','png','jpg']
                                );


                                if (pickedFile != null) {
                                  setState(() {

                                    imageFile = File("${pickedFile.files.single.path}");

                                  });
                                }
                              },
                            ),
                            imageFile!=null?ListTile(
                              leading: new Icon(
                                Icons.remove_red_eye,
                                color: Colors.black,
                              ),
                              title: new Text(
                                'View',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>ViewImage(imageFile, "image")));
                              },

                            ):Container(),
                          ],
                        ),
                      );
                    });




              },
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 15,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 1, style: BorderStyle.solid)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Profile Picture',
                        style: TextStyle(fontSize: 22),
                      ),
                      InkWell(
                        onTap: () {
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height/2,
                          width: MediaQuery.of(context).size.width/6,
                          child: imageFile == null
                              ? Container()
                              : Image.file(imageFile),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            InkWell(
              onTap: () {
              showModalBottomSheet(
                    context: context,
                    builder: (BuildContext bc) {
                      return Container(
                        child: new Wrap(
                          children: <Widget>[

                            new ListTile(
                                leading: new Icon(
                                  Icons.document_scanner,
                                  color: Colors.blue,
                                ),
                                title: new Text(
                                  'Documents',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () async {
                                  FilePickerResult? result = await FilePicker
                                      .platform
                                      .pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: ['pdf']);

                                  if (result != null) {
                                    setState(() {

                                      drivinglicense =
                                          File("${result.files.single.path}");
                                    });
                                  }
                                }),
                            drivinglicense!=null?ListTile(
                              leading: new Icon(
                                Icons.remove_red_eye,
                                color: Colors.black,
                              ),
                              title: new Text(
                                'View',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>ViewImage(drivinglicense , "pdf")));
                              },

                            ):Container(),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 15,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 1.0, style: BorderStyle.solid)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Driving License',
                        style: TextStyle(fontSize: 22),
                      ),
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height/2,
                          width: MediaQuery.of(context).size.width/6,
                          child:  drivinglicense == null
                              ? Container(
                          )
                              : SfPdfViewer.file(
                            drivinglicense,
                            initialScrollOffset: Offset.zero,

                          ),
                        ),
                      ),

                    ],
                  ),

                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            InkWell(
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext bc) {
                      return Container(
                        child: new Wrap(
                          children: <Widget>[
                            new ListTile(
                                leading: new Icon(
                                  Icons.document_scanner,
                                  color: Colors.blue,
                                ),
                                title: new Text(
                                  'Documents',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () async {
                                  FilePickerResult? result = await FilePicker
                                      .platform
                                      .pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: ['pdf']);

                                  if (result != null) {
                                    setState(() {
                                      Certificate =
                                          File("${result.files.single.path}");
                                    });
                                  }
                                }),
                            Certificate!=null?ListTile(
                              leading: new Icon(
                                Icons.remove_red_eye,
                                color: Colors.black,
                              ),
                              title: new Text(
                                'View',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>ViewImage(Certificate , "pdf")));
                              },

                            ):Container(),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 15,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 1, style: BorderStyle.solid)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Certificate',
                        style: TextStyle(fontSize: 22),
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height/2,
                          width: MediaQuery.of(context).size.width/7,
                          child: Certificate == null
                              ? Container(

                          )
                              : SfPdfViewer.file(
                            Certificate,
                              
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            InkWell(
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext bc) {
                      return Container(
                        child: new Wrap(
                          children: <Widget>[
                            new ListTile(
                                leading: new Icon(
                                  Icons.document_scanner,
                                  color: Colors.blue,
                                ),
                                title: new Text(
                                  'Documents',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () async {
                                  FilePickerResult? result = await FilePicker
                                      .platform
                                      .pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: ['pdf']);

                                  if (result != null) {
                                    setState(() {
                                      Passport =
                                          File("${result.files.single.path}");
                                    });
                                  }
                                }),
                            Passport!=null?ListTile(
                              leading: new Icon(
                                Icons.remove_red_eye,
                                color: Colors.black,
                              ),
                              title: new Text(
                                'View',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>ViewImage(Passport , "pdf")));
                              },

                            ):Container(),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 15,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 1, style: BorderStyle.solid)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Passport',
                        style: TextStyle(fontSize: 22),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height/2,
                        width: MediaQuery.of(context).size.width/6,
                        child: Passport == null
                            ? Container(

                        )
                            : SfPdfViewer.file(

                          Passport,

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
            InkWell(
              onTap: buttonchecker ? (){
                Fluttertoast.showToast(msg: "Please Submit the Documents");
              }: () {
                Navigator.of(context).pushNamed("/dashboard");
              },
              child: Container(
                //height: 50,

                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 15,
                alignment: Alignment.center,
                child: Text('DONE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
                decoration: BoxDecoration(
                  color: buttonchecker
                      ? Colors.grey
                      : Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  pageIndicator() {
    if(imageFile != null && Certificate !=null && drivinglicense!=null && Passport!=null){
      setState(() {
        buttonchecker = false;
      });
    }

    return Padding(
      padding: EdgeInsets.all(30),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                color:
                    imageFile == null ? Color(0xffdbdbdb) : Color(0xFF00818A),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 10,
          ),
          Expanded(
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                color: drivinglicense == null
                    ? Color(0xffdbdbdb)
                    : Color(0xFF00818A),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 10,
          ),
          Expanded(
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                color: Certificate == null
                ? Color(0xffdbdbdb)
                    : Color(0xFF00818A) ,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 10,
          ),
          Expanded(
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                color: Passport == null
                    ? Color(0xffdbdbdb)
                    : Color(0xFF00818A),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
