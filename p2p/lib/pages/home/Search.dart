import 'package:flutter/material.dart';
import 'package:p2p/Controller.dart';
import 'package:p2p/service/GroupService.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchControll = new TextEditingController();
  final ScrollController _listControll = new ScrollController();
  final Controller _controll = new Controller();
  List _results = new List();
  List _filteredResults = new List();
  int _state = 0;

  /*
  baseado em: https://github.com/ahmed-alzahrani/Flutter_Search_Example
  */
  _SearchState() {
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
            decoration: InputDecoration(labelText: "Buscar"),
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
      onTap: () {
        if(_state==0){
          List<String> temp = new List();
          temp =  _controll.getPlayerList(_filteredResults[index]);
          setState((){
            _filteredResults = temp;
            _state = 1;
        });
      } else{
          Navigator.of(context).pushNamed('/profile', arguments: [
            _controll.getPlayerProfile(index)
          ]);

      }
      },
    );
  }

  @override
  void initState() {
    setState(() {
      _results = ["Rainbow Six Siege", "Outlast", "Rocket League", "Vôlei"];
      _filteredResults = _results;
    });
    super.initState();
  }
}
