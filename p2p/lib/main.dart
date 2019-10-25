import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new Layout()));
}

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Profile(),
    Text(
      'Descobrir',
      style: optionStyle,
    ),
    Text(
      'Conversas',
      style: optionStyle,
    ),
    Text(
      'Pesquisar',
      style: optionStyle,
    ),
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

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
              labelText: "Nomezenho",
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
              labelText: "Emailzitu",
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
            onPressed: () {},
            color: Colors.cyanAccent[700],
            child: Text(
              "Cadastrar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
