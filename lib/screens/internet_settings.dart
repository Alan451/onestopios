import 'package:flutter/material.dart';
import 'package:onestop_ios/screens/IPCalculator.dart';

class InternetSettings extends StatelessWidget {
  static String id = 'internet_settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internet Settings'),
      ),
      body: Container(
        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SizedBox.expand(
                child: new RaisedButton(
                  onPressed: (){
                    // Navigate to LAN settings
                  },
                  color: Colors.white,
                  child: Text(
                      'LAN Settings',
                      textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox.expand(
                child: new RaisedButton(
                  onPressed: (){
                    // Navigate to DC++ settings
                  },
                  color: Colors.white,
                  child: Text(
                      'DC++ Settings',
                      textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox.expand(
                child: new FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, IPCalculator.id); // Navigate to IP Calculator
                  },
                  color: Colors.white,
                  child: Text(
                      'Hostel IP Calcuator',
                      textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}

