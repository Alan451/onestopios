import 'package:flutter/material.dart';
import 'drawer.dart';
import 'timings.dart';

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
    Timing(),
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
    );
  }
}
