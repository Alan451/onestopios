import 'package:flutter/material.dart';
import 'package:onestop_ios/screens/InternalBus.dart';
import 'IitgBus.dart';
import 'Ferry.dart';
class Timing extends StatelessWidget {
  static const id = 'timing';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(

             onPressed: () {
              Navigator.pushNamed(context, IitgBus.id);
            },
            child: Text('IITG Bus'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, InternalBus.id);
            },
            child: Text('Internal Bus'),
          ),
          RaisedButton(
             onPressed: () {
              Navigator.pushNamed(context, Ferry.id);
            },
            child: Text('Ferry'),
          ),
        ],
      ),
    );
  }
}
