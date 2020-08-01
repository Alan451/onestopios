import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'screens/HomeScreen.dart';
=======
import 'package:onestop_ios/screens/timings.dart';
import 'package:onestop_ios/screens/HomeScreen.dart';
>>>>>>> 2ca1133753803f4a2916bd2a52c158c30a80db2e

import 'screens/HomeScreen.dart';
import 'screens/HomeScreen.dart';

<<<<<<< HEAD
=======
// this is the root of our application
void main() async {
  runApp(MyApp());
}

// MyApp is used to store all routes and takes the user to the page corresponding to initial route ('/)
>>>>>>> 2ca1133753803f4a2916bd2a52c158c30a80db2e
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
=======
      title: 'OneStop',
      initialRoute: MyHomePage.id,
      debugShowCheckedModeBanner: false,
      routes: {
        Timing.id: (context) => Timing(),
        MyHomePage.id: (context) => MyHomePage(),
>>>>>>> 2ca1133753803f4a2916bd2a52c158c30a80db2e
      },
    );
  }
}
