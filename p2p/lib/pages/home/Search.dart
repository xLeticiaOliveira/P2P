import 'dart:io';
import 'package:flutter/material.dart';
import 'package:p2p/service/GroupService.dart';
import 'package:p2p/service/SearchService.dart';
import 'package:path_provider/path_provider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchControll = new TextEditingController();
  final ScrollController _listControll = new ScrollController();

  String request = "http:\/\/127.0.0.1:5000/";

  List _results = new List();
  List _filteredResults = new List();

  _SearchState() {
    _searchControll.addListener(() {
      if (_searchControll.text.isNotEmpty) {
        setState(() {
          _filteredResults = List();
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
        Navigator.of(context).pushNamed('/profile', arguments: [
          _filteredResults[index],
          _filteredResults[index],
          _filteredResults[index]
        ]);
      },
      trailing: IconButton(
        icon: Icon(Icons.person_add),
        onPressed: () {
          (new GroupService()).addToGroup(1, 1);
        },
      ),
    );
  }

  @override
  void initState() {
    setState(() {
      _results = (new GroupService()).getGroups();
      _filteredResults = _results;
    });
    super.initState();
  }
}
