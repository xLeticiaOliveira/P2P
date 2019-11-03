import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Player2Player'),
          backgroundColor: Colors.cyanAccent[700],
        ),
        body: Center(
            child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  children: <Widget>[
                    Text('Player2Player',
                        style: TextStyle(
                            color: Colors.cyanAccent[700], fontSize: 50)),
                  ],
                ),
              ),
              Divider(),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email ou Usuário",
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
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
                color: Colors.cyanAccent[700],
                child: Text(
                  "Entrar",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              InkWell(
                child: new Text('Clique aqui para se registrar'),
                onTap: () {
                  Navigator.of(context).pushNamed('/register', arguments: 0);
                },
              ),
            ],
          ),
        )),
      );
      Navigator.of(context).pushNamed('/home');
  }
}
