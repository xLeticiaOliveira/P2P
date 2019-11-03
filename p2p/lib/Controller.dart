import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:p2p/PlayerData.dart';
import 'package:http/http.dart' as http;

class Controller {

  String _request = "http://10.0.2.2:5000";
  Map _players = new Map();

  Future<Map> _getData(String path) async {
    http.Response response = await http.get(_request+path);
    return json.decode(response.body);
  }


  Future<List<String>> getPlayerList(String game) async {
    _players = await  _getData("/perfil-game/"+game);
    List<String> playerList = new List();
    List<dynamic> temp = new List();
    temp = _players["jogadores"];
    for(int index = 0; index<temp.length; index++){
      playerList.add(_players["jogadores"][index]["nick"]);
    }
    return playerList;
  }

  PlayerData getPlayerProfile(int index){
    return new PlayerData(_players["jogadores"][index]);
  }

}
