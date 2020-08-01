import 'package:flutter/material.dart';
import 'InternalBus.dart';

class Timing extends StatelessWidget {
  static const id = 'timing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('timings'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: null,
                child: Text('IITG Bus'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, InternalBus.id);
                },
                child: Text('Internal Bus'),
              ),
              RaisedButton(
                onPressed: null,
                child: Text('Ferry'),
              ),
            ],
          ),
        ));
  }
}
