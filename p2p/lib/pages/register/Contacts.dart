<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:p2p/pages/register/Register.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
=======
import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:p2p/pages/register/Register.dart';
import 'package:path_provider/path_provider.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

>>>>>>> finalTeste
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
          Form(
              key: _formKey,
              child: Column(children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Telefone",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                    border: OutlineInputBorder(),
                  ),
                ),
                Divider(),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Discord",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                    border: OutlineInputBorder(),
                  ),
                ),
                Divider(),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Facebook",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                    border: OutlineInputBorder(),
                  ),
                ),
                Divider(),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Instagram",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                    border: OutlineInputBorder(),
                  ),
                ),
                Divider(),
                TextFormField(
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
                    if (_formKey.currentState.validate()) {
                      Navigator.of(context)
                          .pushNamed('/register', arguments: 2);
                    }
                  },
                  color: Colors.cyanAccent[700],
                  child: Text(
                    "Próximo",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ]))
        ],
      ),
    );
  }
}
