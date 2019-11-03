import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:p2p/service/ContactService.dart';
import 'package:path_provider/path_provider.dart';

import '../../PlayerData.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final TextEditingController _searchControll = new TextEditingController();
  final ScrollController _listControll = new ScrollController();
  ContactService _controll = new ContactService();
  List<PlayerData> _contactList = new List();

  List<String> _filteredResults = new List();

  void resetFilter(){
    setState(() {
      List<String> temp = new List();
      for(PlayerData player in _contactList){
        temp.add(player.nick);
      }
      _filteredResults = temp;
    });
  }

  _ContactState() {
    _searchControll.addListener(() {
      if (_searchControll.text.isNotEmpty) {
        setState(() {
          _filteredResults = new List();
          for (int i = 0; i < _contactList.length; i++) {
            if (_contactList[i].nick.toLowerCase().contains(_searchControll.text.toLowerCase())){
              _filteredResults.add(_contactList[i].nick);
            }
          }
        });
      } else{
        resetFilter();
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
      onTap: (){
        Navigator.of(context).pushNamed(
            '/contact',
            arguments:
            _contactList[index]
        );
      },
    );
  }


  @override
  Future<void> initState() {
    super.initState();
    _controll.initContactList().then((data) {
      setState(() {
        _contactList = data;
        resetFilter();
      });
    });
  }
}
