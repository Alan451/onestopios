import 'package:flutter/material.dart';
import 'screens/timings.dart';
import 'screens/HomeScreen.dart';

// this is the root of our application
void main() async {
  runApp(MyApp());
}

// MyApp is used to store all routes and takes the user to the page corresponding to initial route ('/)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
        });
  }
}
