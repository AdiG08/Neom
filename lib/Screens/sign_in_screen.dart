import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              radius: 60.0,
              foregroundImage: AssetImage('assets/images/download.png'),
            ),
          ),
          SizedBox(height: 10.0),
          ElevatedButton.icon(
            icon: const FaIcon(FontAwesomeIcons.google, color: Colors.amber),
            label: const Text(
              'Login Using Google',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
