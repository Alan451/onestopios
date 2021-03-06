import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//widget for the my profile page displaying user's details
class InternalBus extends StatefulWidget {
  static const id = "internal_bus";
  @override
  _InternalBusState createState() => _InternalBusState();
}

class _InternalBusState extends State<InternalBus> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('timings'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'Internal Bus',
                  textAlign: TextAlign.center,
                  textScaleFactor: 3.0,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
              ),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        width: 1.2,
                        color: Colors.brown[500],
                      )),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.accessibility,
                      color: Colors.yellow,
                    ),
                    title: Text(
                      '9.50 AM',
                    ),
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        width: 1.2,
                        color: Colors.brown[500],
                      )),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.accessibility,
                      color: Colors.yellow,
                    ),
                    title: Text(
                      '10:00AM',
                    ),
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        width: 1.2,
                        color: Colors.brown[500],
                      )),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.accessibility,
                      color: Colors.yellow,
                    ),
                    title: Text(
                      '10:00AM',
                    ),
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        width: 1.2,
                        color: Colors.brown[500],
                      )),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.accessibility,
                      color: Colors.yellow,
                    ),
                    title: Text(
                      '10:00AM',
                    ),
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        width: 1.2,
                        color: Colors.brown[500],
                      )),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.accessibility,
                      color: Colors.yellow,
                    ),
                    title: Text(
                      '10:00AM',
                    ),
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        width: 1.2,
                        color: Colors.brown[500],
                      )),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.accessibility,
                      color: Colors.yellow,
                    ),
                    title: Text(
                      '10:00AM',
                    ),
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        width: 1.2,
                        color: Colors.brown[500],
                      )),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.accessibility,
                      color: Colors.yellow,
                    ),
                    title: Text(
                      '10:00AM',
                    ),
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        width: 1.2,
                        color: Colors.brown[500],
                      )),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.accessibility,
                      color: Colors.yellow,
                    ),
                    title: Text(
                      '10:00AM',
                    ),
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        width: 1.2,
                        color: Colors.brown[500],
                      )),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.accessibility,
                      color: Colors.yellow,
                    ),
                    title: Text(
                      '10:00AM',
                    ),
                  )),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        width: 1.2,
                        color: Colors.brown[500],
                      )),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.accessibility,
                      color: Colors.yellow,
                    ),
                    title: Text(
                      '10:00AM',
                    ),
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
