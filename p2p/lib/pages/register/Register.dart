import 'package:flutter/material.dart';
import 'package:p2p/pages/register/Contacts.dart';
import 'package:p2p/pages/register/Intersting.dart';
import 'package:p2p/pages/register/PersonalData.dart';

class Register extends StatefulWidget {
  int _index;

  Register(int index) {
    this._index = index;
  }
  @override
  _RegisterState createState() => _RegisterState(this._index);
}

class _RegisterState extends State<Register> {
  int _selectedIndex = 0;

  _RegisterState(int index) {
    _selectedIndex = index;
  }

  static List<Widget> _widgetOptions = <Widget>[
    PersonalInfo(),
    Contacts(),
    Intersting()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Player2Player'),
          backgroundColor: Colors.cyanAccent[700],
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Perfil'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.phone),
              title: Text('Contatos'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('Interesses'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.cyan[800],
          iconSize: 40,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ));
  }
}
