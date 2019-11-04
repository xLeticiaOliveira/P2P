import 'package:flutter/material.dart';
import 'package:p2p/pages/home/Search.dart';
import 'package:p2p/pages/home/Contact.dart';
import 'package:p2p/pages/home/Profile.dart';
import 'package:p2p/service/UserService.dart';
import 'package:p2p/pages/home/Discovery.dart';

class Layout extends StatefulWidget {
  int _index;
  Layout(int index){
    this._index = index;
  }

  @override
  _LayoutState createState() => _LayoutState(_index);

}

class _LayoutState extends State<Layout> {

  int _selectedIndex = 1;

  _LayoutState(int index){
      this._selectedIndex = index;
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    Profile((new UserService()).getUserById(1)),
    Discovery(),
    Contact(),
    Search(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Next Match'),
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
                icon: Icon(Icons.star),
                title: Text('Descobrir'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text('Conversas'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Buscar'),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.cyan[800],
            iconSize: 40,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,

            onTap: _onItemTapped));
  }
}
