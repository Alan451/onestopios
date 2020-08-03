import 'package:flutter/material.dart';
import 'package:onestop_ios/main.dart';

class AboutScreen extends StatelessWidget {
  static String id = 'about_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
        body:  ListView(children: [
          Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                margin: const EdgeInsets.all(7.0),
                child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 10.0,
                          ),
                          ListTile(
                            title: Text('OneStopIITG',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 28.0,
                                    fontFamily: 'Segoe UI',
                                    color: Colors.grey[700])),
                            subtitle: Text('c2018 SWC',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Segoe UI',
                                    color: Colors.grey[700])),
                            leading: Image.asset(
                              'images/bus.jpg',
                              width: 35.0,
                              height: 35.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ListTile(
                              title: Text('Version',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Segoe UI',
                                      color: Colors.grey[700])),
                              subtitle: Text('1.0',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Segoe UI',
                                      color: Colors.grey[700])),
                              leading: Icon(Icons.info_outline,
                                  color: Colors.grey[800])),
                          ListTile(
                              title: Text('OneStopIITG',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Segoe UI',
                                      color: Colors.grey[800])),
                              subtitle: Text('c2018 SWC',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Segoe UI',
                                      color: Colors.grey[700])),
                              leading:
                              Icon(Icons.info, color: Colors.grey[800])),
                          ListTile(
                              title: Text('Report Bugs/Help',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Segoe UI',
                                      color: Colors.grey[800])),
                              subtitle: Text(
                                  'We hate bugs! In mess food or our app',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Segoe UI',
                                      color: Colors.grey[700])),
                              leading: Icon(Icons.bug_report,
                                  color: Colors.grey[800])),
                        ]))),
            SizedBox(height: 10.0),
            Container(
                margin: const EdgeInsets.all(7.0),
                child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 10.0,
                          ),
                          ListTile(
                            title: Text('Team',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Segoe UI',
                                    color: Colors.grey[900])),
                          ),
                          ListTile(
                            title: Text('Team',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Segoe UI',
                                    color: Colors.grey[700])),
                            leading: Icon(Icons.group, color: Colors.grey[800]),
                          ),
                          Container(
                            color: Colors.grey[200],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 35.0),
                                ListTile(
                                    title: Text('Gaddam Nikhil',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Segoe UI',
                                            color: Colors.grey[900])),
                                    subtitle: Text('SWC General Secretary',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Segoe UI',
                                            color: Colors.grey[700])),
                                    leading: Container(
                                      width: 60.0,
                                      height: 80.0,
                                      decoration: new BoxDecoration(
                                        color: Colors.white,
                                        image: new DecorationImage(
                                          image: AssetImage('images/bus.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(50.0)),
                                        border: new Border.all(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                    )),
                                SizedBox(height: 20.0),
                                ListTile(
                                    title: Text('Tushar Yadav',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Segoe UI',
                                            color: Colors.grey[900])),
                                    subtitle: Text('Ex-SWC General Secretary',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Segoe UI',
                                            color: Colors.grey[700])),
                                    leading: Container(
                                      width: 60.0,
                                      height: 80.0,
                                      decoration: new BoxDecoration(
                                        color: Colors.white,
                                        image: new DecorationImage(
                                          image: AssetImage('images/bus.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(50.0)),
                                        border: new Border.all(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                    )),
                                SizedBox(height: 20.0),
                                ListTile(
                                    title: Text('Anshuman Dhar',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Segoe UI',
                                            color: Colors.grey[900])),
                                    subtitle: Text('UX Developer',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Segoe UI',
                                            color: Colors.grey[700])),
                                    leading: Container(
                                      width: 60.0,
                                      height: 80.0,
                                      decoration: new BoxDecoration(
                                        color: Colors.white,
                                        image: new DecorationImage(
                                          image: AssetImage('images/bus.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(50.0)),
                                        border: new Border.all(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                    )),
                                SizedBox(height: 20.0),
                                ListTile(
                                    title: Text('Shivam Kumar',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Segoe UI',
                                            color: Colors.grey[900])),
                                    subtitle: Text('Backend Developer',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Segoe UI',
                                            color: Colors.grey[700])),
                                    leading: Container(
                                      width: 60.0,
                                      height: 80.0,
                                      decoration: new BoxDecoration(
                                        color: Colors.white,
                                        image: new DecorationImage(
                                          image: AssetImage('images/bus.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(50.0)),
                                        border: new Border.all(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                    )),
                                SizedBox(height: 20.0),
                              ],
                            ),
                          )
                        ]))),
          ])
        ])
    );
  }
}
