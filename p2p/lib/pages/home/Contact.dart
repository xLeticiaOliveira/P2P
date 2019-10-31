import 'package:flutter/material.dart';
import 'package:p2p/service/GroupService.dart';
import 'package:p2p/service/SearchService.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final TextEditingController _searchControll = new TextEditingController();
  final ScrollController _listControll = new ScrollController();

  String request = "http:\/\/127.0.0.1:5000/";


  List _results = new List();
  List _filteredResults = new List();

  _ContactState() {
    _searchControll.addListener(() {
      if (_searchControll.text.isNotEmpty) {
        setState(() {
          _filteredResults = (new SearchService())
              .fillteredSearch(_results, _searchControll.text.toLowerCase());
        });
      } else {
        setState(() {
          _filteredResults = _results;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _searchControll,
            decoration: InputDecoration(
                labelText: "Buscar",
                labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                border: OutlineInputBorder()),
          ),
          Expanded(child: _buildList())
        ],
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      controller: _listControll,
      itemCount: _filteredResults.length,
      itemBuilder: _buildItem,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return ListTile(
      title: Text(_filteredResults[index]),
      onTap: () {
        Navigator.of(context).pushNamed('/profile', arguments: [_filteredResults[index],_filteredResults[index],_filteredResults[index]]);
      },
    );
  }

  @override
  void initState() {
    setState(() {
      _results = (new GroupService()).getUserGroups(1);
      _filteredResults = _results;
    });
    super.initState();
  }
}
