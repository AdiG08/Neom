import 'package:flutter/material.dart';
import 'package:neom/google_signIn.dart';
import 'package:provider/provider.dart';

class SignIn_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Neom'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: TextButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
              child: Text('SignIn using Google'),
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.lightBlueAccent,
                  padding: EdgeInsets.all(10.0),
                  minimumSize: Size(100, 30)),
            ),
          ),
        ],
      ),
    );
  }
}
