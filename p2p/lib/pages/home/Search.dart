import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchControll = new TextEditingController();
  final ScrollController _listControll = new ScrollController();

  List _results= [];

  void _changeList(String text) {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _searchControll,
                  decoration: InputDecoration(
                      labelText: "Buscar",
                      labelStyle: TextStyle(color: Colors.cyan[800])),
                  onChanged: _changeList,
                ),
              ),
              RaisedButton(
                color: Colors.cyan,
                child: Icon(Icons.search),
                textColor: Colors.white,
                onPressed: () {},
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: _buildItem,
                  itemCount: _results.length,
                  controller: _listControll
                )
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, int index){
    return ListTile(
      title: Text(_results[index]["Grupo"]),
      onTap: openCard,
      );
  }

  void openCard(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GroupInfo()),
    );
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
    super.initState();
    _readData().then((data) {
      setState(() {
        _results = json.decode(data);
      });
    });
  }
}



class GroupInfo extends StatefulWidget {
  @override
  _GroupInfoState createState() => _GroupInfoState();
}

class _GroupInfoState extends State<GroupInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Grupo info"),
        RaisedButton(
          child: Text("participar"),
          onPressed: (){},
        )
      ],
    );
  }
}

