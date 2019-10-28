import 'package:flutter/material.dart';
import 'package:p2p/pages/register/Register.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Column(
              children: <Widget>[
                Text('Contatos',
                    style:
                        TextStyle(color: Colors.cyanAccent[700], fontSize: 50)),
                Text(
                    'Essas informações só seräo divulgadas com sua autirização.'),
              ],
            ),
          ),
          Divider(),
          TextField(
            decoration: InputDecoration(
              labelText: "Telefone",
              labelStyle: TextStyle(fontSize: 20, color: Colors.black),
              border: OutlineInputBorder(),
            ),
          ),
          Divider(),
          TextField(
            decoration: InputDecoration(
              labelText: "Discord",
              labelStyle: TextStyle(fontSize: 20, color: Colors.black),
              border: OutlineInputBorder(),
            ),
          ),
          Divider(),
          TextField(
            decoration: InputDecoration(
              labelText: "Facebook",
              labelStyle: TextStyle(fontSize: 20, color: Colors.black),
              border: OutlineInputBorder(),
            ),
          ),
          Divider(),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Instagram",
              labelStyle: TextStyle(fontSize: 20, color: Colors.black),
              border: OutlineInputBorder(),
            ),
          ),
          Divider(),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Twitter",
              labelStyle: TextStyle(fontSize: 20, color: Colors.black),
              border: OutlineInputBorder(),
            ),
          ),
          Divider(),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Register(2)),
              );
            },
            color: Colors.cyanAccent[700],
            child: Text(
              "Próximo",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
