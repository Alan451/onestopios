import 'package:flutter/material.dart';
import 'package:onestop_ios/screens/LoginPage.dart';
import 'package:onestop_ios/screens/about.dart';
import 'package:onestop_ios/screens/internet_settings.dart';
import 'package:onestop_ios/screens/quePaper.dart';
import 'package:aad_oauth/aad_oauth.dart';

class DrawerWidget extends StatelessWidget {
  final AadOAuth oauth = AadOAuth(LoginPage.config);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF3166CC),
        padding: EdgeInsets.all(10.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              child: Center(
                child: Text(
                  'Hi User!',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Center(
                child: Text(
                  'Hostel',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTileWidget(
              text: 'Subscription',
              icon: Icon(
                Icons.access_alarm,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            ListTileWidget(
              text: 'Blog',
              icon: Icon(
                Icons.speaker_notes,
                color: Colors.white,
              ),
              onTap: () {
                //TODO:Navigate to that screen
                print('done');
              },
            ),
            ListTileWidget(
              text: 'Notifications',
              icon: Icon(
                Icons.access_alarm,
                color: Colors.white,
              ),
              onTap: () {
                //TODO:Navigate to that screen
                print('done');
              },
            ),
            ListTileWidget(
              text: 'Alumni Meet',
              icon: Icon(
                Icons.access_alarm,
                color: Colors.white,
              ),
              onTap: () {
                //TODO:Navigate to that screen
                print('done');
              },
            ),
            ListTileWidget(
              text: 'Time Table',
              icon: Icon(
                Icons.access_alarm,
                color: Colors.white,
              ),
              onTap: () {
                //TODO:Navigate to that screen
                print('done');
              },
            ),
            ListTileWidget(
              text: 'Map',
              icon: Icon(
                Icons.access_alarm,
                color: Colors.white,
              ),
              onTap: () {
                //TODO:Navigate to that screen
                print('done');
              },
            ),
            ListTileWidget(
              text: 'Internet Settings',
              icon: Icon(
                Icons.access_alarm,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pushNamed(context, InternetSettings.id);
                print('done');
              },
            ),
            ListTileWidget(
              text: 'Previous Year Questions',
              icon: Icon(
                Icons.access_alarm,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => quePaper(),
                  ),
                );
                //TODO:Navigate to that screen
                print('done');
              },
            ),
            ListTileWidget(
              text: 'Contacts',
              icon: Icon(
                Icons.access_alarm,
                color: Colors.white,
              ),
              onTap: () {
                //TODO:Navigate to that screen
                print('done');
              },
            ),
            ListTileWidget(
              text: 'About',
              icon: Icon(
                Icons.access_alarm,
                color: Colors.white,
              ),
              onTap: () {
                //TODO:Navigate to that screen
                Navigator.pushNamed(context, AboutScreen.id);
                print('done');
              },
            ),
            ListTileWidget(
              text: 'Logout',
              icon: Icon(
                Icons.access_alarm,
                color: Colors.white,
              ),
              onTap: () async {
                await oauth.logout();
                Navigator.popAndPushNamed(context, LoginPage.id);
                //TODO:Navigate to that screen
                print('done');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({@required this.text, @required this.icon, this.onTap});
  final String text;
  final Icon icon;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        title: Text(text, style: TextStyle(color: Colors.white)),
        leading: icon,
        onTap: onTap,
      ),
    );
  }
}
