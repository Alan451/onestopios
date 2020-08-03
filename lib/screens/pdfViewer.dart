import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class PdfViewerPage extends StatefulWidget {
  final String url;

  const PdfViewerPage({Key key, this.url}) : super(key: key);
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  PDFDocument _document;
  loadPage() async {
    var document = await PDFDocument.fromURL(widget.url);
    setState(() {
      _document = document;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPage();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PDFViewer(document: _document),
    );
  }
}
