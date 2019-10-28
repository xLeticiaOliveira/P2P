import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(
            Icons.person,
            size: 120,
            color: Colors.cyanAccent[700],
          ),
          Text(
            "Marcão Rodriguez",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.cyanAccent[700]),
          ),
          Text(
            "supermarcao",
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800]),
          ),
          Divider(),
          Text(
            "Contatos:",
            style: TextStyle(fontSize: 20, color: Colors.grey[800]),
          ),
          Text("- Lista de contatos"),
          Divider(),
          Text(
            "Grupos:",
            style: TextStyle(fontSize: 20, color: Colors.grey[800]),
          ),
          Text("- Lista de contatos"),
        ],
      ),
    );
  }
}
