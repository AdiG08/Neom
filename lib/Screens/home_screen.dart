import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'logged_in_screen.dart';
import 'sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
        });
  }
}
