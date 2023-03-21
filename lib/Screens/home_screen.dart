import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neom/google_signIn.dart';
import 'package:provider/provider.dart';

import 'logged_in_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Neom'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Something Went Wrong'));
            } else if (snapshot.hasData) {
              return LoggedInScreen();
            } else {
              return SignIn_Screen();
            }
          }),
    );
  }
}

class SignIn_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: TextButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            },
            child: Text('Register'),
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.lightBlueAccent,
                padding: EdgeInsets.all(10.0),
                minimumSize: Size(100, 30)),
          ),
        ),
        SizedBox(height: 10.0),
        Center(
          child: TextButton(
            onPressed: () {},
            child: Text('Login'),
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(10.0),
              primary: Colors.white,
              backgroundColor: Colors.lightBlueAccent,
              minimumSize: Size(100, 30),
            ),
          ),
        ),
      ],
    );
  }
}
