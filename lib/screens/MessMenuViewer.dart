import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'pdfViewer.dart';

class MessMenuViewer extends StatefulWidget {
  @override
  _MessMenuViewerState createState() => _MessMenuViewerState();
}

class _MessMenuViewerState extends State<MessMenuViewer> {
  String _value;
  Firestore _firestore = Firestore.instance;
  String pdfUrls;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.10),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Container(
              color: Colors.black12,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.10),
              child: _isLoading
                  ? CircularProgressIndicator()
                  : DropdownButton(
                      isExpanded: true,
                      hint: Center(child: Text('Select --')),
//                elevation: 200,
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Center(
                            child: Text("DIHING"),
                          ),
                          value: "DIHING",
                        ),
                        DropdownMenuItem(
                          child: Center(child: Text("BARAK")),
                          value: "BARAK",
                        ),
                        DropdownMenuItem(
                          child: Center(child: Text("BRAHMAPUTRA")),
                          value: "BRAHMAPUTRA",
                        ),
                        DropdownMenuItem(
                          child: Center(child: Text("DHANSIRI")),
                          value: "DHANSIRI",
                        ),
                        DropdownMenuItem(
                          child: Center(child: Text("DIBANG")),
                          value: "DIBANG",
                        ),
                        DropdownMenuItem(
                          child: Center(child: Text("KAMENG")),
                          value: "KAMENG",
                        ),
                        DropdownMenuItem(
                          child: Center(child: Text("KAPILI")),
                          value: "KAPILI",
                        ),
                        DropdownMenuItem(
                          child: Center(child: Text("LOHIT")),
                          value: "LOHIT",
                        ),
                        DropdownMenuItem(
                          child: Center(child: Text("MANAS")),
                          value: "MANAS",
                        ),
                        DropdownMenuItem(
                          child: Center(child: Text("SIANG")),
                          value: "SIANG",
                        ),
                        DropdownMenuItem(
                          child: Center(child: Text("UMIAM")),
                          value: "UMIAM",
                        ),
                        DropdownMenuItem(
                          child: Center(child: Text("SUBHANSIRI")),
                          value: "SUBHANSIRI",
                        ),
                      ],
                      onChanged: (value) async {
                        setState(() {
                          _value = value;
                          _isLoading = true;
                        });
                        DocumentSnapshot snapshot = await _firestore
                            .collection('MessMenuURLs')
                            .document('URLs')
                            .get();

                        setState(() {
                          pdfUrls = snapshot[value];
                          _isLoading = false;
                        });
                      },
                    ),
            ),
          ),
        ),
      ),
      body: (pdfUrls == null)
          ? Container(
              color: Colors.white,
            )
          : PdfViewerPage(
              url: pdfUrls,
            ),
    );
  }
}
