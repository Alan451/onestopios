import 'package:flutter/material.dart';
import 'package:onestop_ios/screens/timings.dart';

class MyHomePage extends StatefulWidget {
  @override
  static const id = 'home_page';
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        title: Text('onestop'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to home',
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, Timing.id);
              },
              child: Text('timngs'),
            ),
          ],
        ),
      ),

// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
