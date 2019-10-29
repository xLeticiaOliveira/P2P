import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _contactSearchController = TextEditingController();
  List _contactList=[];


  void _addGroup(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GroupCreate()),
    );
  }

  void _searchContact(String data){

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
                    controller: _contactSearchController,
                    decoration: InputDecoration(
                        labelText: "Buscar Contato",
                        labelStyle: TextStyle(color: Colors.blueAccent)
                    ),
                    onChanged: _searchContact,
                  ),
                ),
                RaisedButton(
                  color: Colors.cyan,
                  child: Text("Search"),
                  textColor: Colors.white,
                  onPressed: (){},
                )
              ],
            ),
          ),
          RaisedButton(
            child: Text("Novo Grupo"),
            color: Colors.cyan,
            textColor: Colors.white,
            onPressed: _addGroup,
            ),
            ListView.builder(
              itemCount: _contactList.length,
              itemBuilder: _buildItem,
            )
        ],
      );
  }
  Widget _buildItem(BuildContext context, int index){
    return ListTile(
      title: Text(_contactList[index]["Grupo"]),
      onTap: (){},
      );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/contacts.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_contactList);
    final file = await _getFile();
    return file.writeAsString(data);
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
        _contactList = json.decode(data);
      });
    });
  }

}


class GroupCreate extends StatefulWidget {
  @override
  _GroupCreateState createState() => _GroupCreateState();
}

class _GroupCreateState extends State<GroupCreate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("criar grupo"),
    );
  }
}