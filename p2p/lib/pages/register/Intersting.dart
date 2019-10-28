import 'package:flutter/material.dart';
import 'package:p2p/pages/home/Layout.dart';

class Intersting extends StatefulWidget {
  @override
  _InterstingState createState() => _InterstingState();
}

class _InterstingState extends State<Intersting> {
  bool checkSports = false;
  bool checkTableGames = false;
  bool checkVirtualGames = false;

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
                Text('Interesse',
                    style:
                        TextStyle(color: Colors.cyanAccent[700], fontSize: 50)),
                Text('Qual seu interesse em participar de nossa plataforma.'),
              ],
            ),
          ),
          Divider(),
          CheckboxListTile(
            title: const Text('Esportes'),
            value: checkSports,
            onChanged: (bool value) {
              setState(() {
                checkSports = checkSports ? false : true;
              });
            },
            secondary: const Icon(Icons.directions_run),
          ),
          Divider(),
          CheckboxListTile(
            title: const Text('Jogos de mesa'),
            value: checkTableGames,
            onChanged: (bool value) {
              setState(() {
                checkTableGames = checkTableGames ? false : true;
              });
            },
            secondary: const Icon(Icons.hourglass_empty),
          ),
          Divider(),
          CheckboxListTile(
            title: const Text('Jogos virtuais'),
            value: checkVirtualGames,
            onChanged: (bool value) {
              setState(() {
                checkVirtualGames = checkVirtualGames ? false : true;
              });
            },
            secondary: const Icon(Icons.games),
          ),
          Divider(),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Layout()),
              );
            },
            color: Colors.cyanAccent[700],
            child: Text(
              "Finalizar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
