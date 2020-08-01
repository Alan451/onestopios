import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'drawer.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> widgetOptions = [
    //TODO:Feed widget
    Container(
      color: Colors.red,
    ),
    //TODO:Mess Menu viewer widget
    Container(
      color: Colors.black54,
    ),
    //TODO:Timings Viewer Widget
    Container(
      color: Colors.white,
    ),
  ];
  List<Text> headingOptions = [
    Text('home.'),
    Text('mess menu.'),
    Text('timings.'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: headingOptions[selectedIndex],
          backgroundColor: Color(0xff3F80FA),
        ),
        drawer: drawerWidget,
        body: widgetOptions[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu),
              title: Text('Mess Menu'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              title: Text('Timings'),
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (int i) {
            setState(() {
              selectedIndex = i;
            });
          },
        ),
      ),
=======
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
>>>>>>> 2ca1133753803f4a2916bd2a52c158c30a80db2e
    );
  }
}
