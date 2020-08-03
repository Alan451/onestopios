import 'package:flutter/material.dart';
import 'package:onestop_ios/screens/InternalBus.dart';
import 'IitgBus.dart';
import 'Ferry.dart';
import 'package:onestop_ios/components/CustumButton.dart';
class Timing extends StatelessWidget {
  static const id = 'timing';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
         margin: EdgeInsets.symmetric(
                                horizontal:10.0,
                                vertical: 10.0),
        child: Column(
          children: <Widget>[
             SizedBox(
height:10.0,
            ),
            CustomButton(
              title:'IITG Bus',
              image: "assets/6.png",
               onPressed: () {
                Navigator.pushNamed(context, IitgBus.id);
              },
             
            ),
            SizedBox(
height:10.0,
            ),
            CustomButton(
              title:'Internal Bus',
              image: "assets/6.png",
              onPressed: () {
                
                Navigator.pushNamed(context, InternalBus.id);
              },
             
            ),
             SizedBox(
height:10.0,
            ),
            CustomButton(
              title: 'Ferry',
              image: "assets/6.png",
               onPressed: () {
                Navigator.pushNamed(context, Ferry.id);
              },
             
            ),
            // FlatButton.icon(onPressed: null, icon: null, label: null),
          ],
        ),

      ),
    );
  }
}
