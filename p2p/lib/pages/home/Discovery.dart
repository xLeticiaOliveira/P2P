import 'package:flutter/material.dart';

class Discovery extends StatefulWidget {
  @override
  _DiscoveryState createState() => _DiscoveryState();
}

class _DiscoveryState extends State<Discovery> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Card(
                      child: Container(
                          width: 180,
                          height: 180,
                          color: Colors.deepOrange,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Numero de Contatos',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                '10',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 55),
                              ),
                            ],
                          )),
                    ),
                    Card(
                      child: Container(
                          width: 180,
                          height: 180,
                          color: Colors.deepPurple,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Numero de Jogos',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                '8',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 55),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                Card(
                  child: Container(
                      width: 370,
                      height: 180,
                      color: Colors.cyanAccent[700],
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Numero de Jogos',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            '8',
                            style: TextStyle(color: Colors.white, fontSize: 55),
                          ),
                        ],
                      )),
                ),
                Card(
                  child: Container(
                      width: 370,
                      height: 370,
                      color: Colors.yellow,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Numero de Jogos',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            '8',
                            style: TextStyle(color: Colors.white, fontSize: 55),
                          ),
                        ],
                      )),
                ),
                Row(
                  children: <Widget>[
                    Card(
                      child: Container(
                          width: 180,
                          height: 370,
                          color: Colors.deepOrange,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Numero de Contatos',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                '10',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 55),
                              ),
                            ],
                          )),
                    ),
                    Column(children: <Widget>[
                      Card(
                      child: Container(
                          width: 180,
                          height: 180,
                          color: Colors.deepPurple,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Numero de Jogos',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                '8',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 55),
                              ),
                            ],
                          )),
                    ),Card(
                      child: Container(
                          width: 180,
                          height: 180,
                          color: Colors.deepPurple,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Numero de Jogos',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                '8',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 55),
                              ),
                            ],
                          )),
                    ),
                    ],)
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
