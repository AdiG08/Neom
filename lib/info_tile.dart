import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String text;
  InfoTile({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      color: Colors.grey,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.blue[900],
        ),
        title: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Source Sans Pro',
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
