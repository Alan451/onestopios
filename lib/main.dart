import 'package:flutter/material.dart';
import 'package:onestop_ios/screens/timings.dart';
import 'package:onestop_ios/screens/HomeScreen.dart';
import 'package:onestop_ios/screens/InternalBus.dart';



// this is the root of our application
void main() async {
  runApp(MyApp());
}

// MyApp is used to store all routes and takes the user to the page corresponding to initial route ('/)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OneStop',
      initialRoute: MyHomePage.id,
      debugShowCheckedModeBanner: false,
      routes: {
        Timing.id: (context) => Timing(),
        MyHomePage.id: (context) => MyHomePage(),
        InternalBus.id:(context)=>InternalBus(),
      },
    );
  }
}
