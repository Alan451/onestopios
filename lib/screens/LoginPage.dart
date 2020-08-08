import 'dart:convert';

import 'package:aad_oauth/model/config.dart';
import 'package:flutter/material.dart';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:onestop_ios/screens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  static final Config config = Config(
      "850aa78d-94e1-4bc6-9cf3-8c11b530701c",
      "830d0aa4-32ae-4c83-9a4b-acf4e970d248",
      "user.read openid profile offline_access",
      "https://login.live.com/oauth20_desktop.srf");

  static String id = 'login_screen';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final AadOAuth oauth = AadOAuth(LoginPage.config);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          color: Colors.yellow,
          child: Text("Login with IITG email"),
          onPressed: () async {
            await oauth.login();
            String accessToken = await oauth.getAccessToken();
            if (oauth.tokenIsValid()) {
              var response = await http.get(
                  'https://graph.microsoft.com/v1.0/me',
                  headers: {HttpHeaders.authorizationHeader: accessToken});
              var data = jsonDecode(response.body);
              Navigator.popAndPushNamed(context, HomeScreen.id);
            } else
              print("error");
          },
        ),
      ),
    );
  }
}
