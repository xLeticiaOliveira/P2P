import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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
          _filteredResults = new List();
          for (int i = 0; i < _results.length; i++) {
            if (_results[i].toString().toLowerCase().contains(_searchControll.text.toLowerCase())){
              _filteredResults.add(_results[i]);
            }
          }
        });
      } else{
        setState(() {
         _filteredResults=_results; 
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: TextField(
            controller: _searchControll,
            decoration: InputDecoration(labelText: "Buscar Contato"),
          ),
        ),
        Expanded(child: _buildList())
      ],
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
      //onTap: _openCard,
    );
  }

  void _openCard() {
    
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  @override
  void initState() {
    setState(() {
      _results = ["Jose", "Rothbard", "Samuel", "Marcelo"];
      _filteredResults = _results;
    });
    super.initState();
  }
}
