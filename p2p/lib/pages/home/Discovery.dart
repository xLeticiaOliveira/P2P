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
                          child: Image.asset(
                            'assets/ps4.jpg',
                            fit: BoxFit.fill,
                          )),
                    ),
                    Card(
                      child: Container(
                          width: 180,
                          height: 180,
                          color: Colors.deepOrange,
                          child: Image.asset(
                            'assets/fofis.jpg',
                            fit: BoxFit.fill,
                          )),
                    ),
                  ],
                ),
                Card(
                  child: Container(
                      width: 370,
                      height: 180,
                      color: Colors.cyanAccent[700],
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 70, 0, 40),
                        child: Text(
                          'Não jogue mais Sozinho',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      )),
                ),
                Card(
                  child: Container(
                      width: 370,
                      height: 370,
                      color: Colors.yellow,
                      child: Image.asset(
                        'assets/ded.jpg',
                        fit: BoxFit.fill,
                      )),
                ),
                Row(
                  children: <Widget>[
                    Card(
                      child: Container(
                        width: 180,
                        height: 370,
                        color: Colors.cyanAccent[700],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Card(
                          child: Container(
                              width: 180,
                              height: 180,
                              color: Colors.deepPurple,
                              child: Image.asset(
                                'assets/xbox.jpg',
                                fit: BoxFit.fill,
                              )),
                        ),
                        Card(
                          child: Container(
                              width: 180,
                              height: 180,
                              color: Colors.deepPurple,
                              child: Image.asset(
                                'assets/boliche1.jpg',
                                fit: BoxFit.fill,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
