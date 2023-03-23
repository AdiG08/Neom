import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neom/info_tile.dart';
import 'package:provider/provider.dart';

import '../google_signIn.dart';

class LoggedInScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
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
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                  radius: 60.0, backgroundImage: NetworkImage(user.photoURL!)),
              SizedBox(height: 8),
              Text(
                user.displayName!,
                style: const TextStyle(
                    fontSize: 35.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Alkatra"),
              ),
              SizedBox(height: 20),
              InfoTile(icon: Icons.mail, text: user.email!),
            ],
          ),
        ),
      ),
    );
  }
}
