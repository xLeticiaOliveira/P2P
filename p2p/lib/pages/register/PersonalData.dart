import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
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
                Text('Cadastro',
                    style:
                        TextStyle(color: Colors.cyanAccent[700], fontSize: 50)),
                Text('Insira seus dados.'),
              ],
            ),
          ),
          Divider(),
          TextField(
            decoration: InputDecoration(
              labelText: "Nome",
              labelStyle: TextStyle(fontSize: 20, color: Colors.black),
              border: OutlineInputBorder(),
            ),
          ),
          Divider(),
          TextField(
            decoration: InputDecoration(
              labelText: "Usuário",
              labelStyle: TextStyle(fontSize: 20, color: Colors.black),
              border: OutlineInputBorder(),
            ),
          ),
          Divider(),
          TextField(
            decoration: InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(fontSize: 20, color: Colors.black),
              border: OutlineInputBorder(),
            ),
          ),
          Divider(),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(fontSize: 20, color: Colors.black),
              border: OutlineInputBorder(),
            ),
          ),
          Divider(),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Confirmar senha",
              labelStyle: TextStyle(fontSize: 20, color: Colors.black),
              border: OutlineInputBorder(),
            ),
          ),
          Divider(),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/register', arguments: 1);
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

