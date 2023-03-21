import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../google_signIn.dart';

class LoggedInScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile'),
            SizedBox(height: 32),
            CircleAvatar(
                radius: 40.0, backgroundImage: NetworkImage(user.photoURL!)),
            SizedBox(height: 8),
            Text('Name ' + user.displayName!),
            SizedBox(height: 8),
            Text('Email ' + user.email!),
          ],
        ),
      ),
    );
  }
}
