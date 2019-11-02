import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class Controller {

  Map _players = new Map();
  Map _pList =
  {
    "jogadores": [
      {
        "jogo": "Rocket League",
        "nick": "70correr",
        "perfil": "Diversao",
        "plataforma": "Steam",
        "rank": "Ouro",
        "usuario": {
          "email": "vini@hotmail.com",
          "id": 1,
          "idade": 25,
          "localizacao": "Sao Paulo, SP",
          "nome": "Vinicius Souza",
          "senha": "fedido"
        }
      },
      {
        "jogo": "Rocket League",
        "nick": "LetsEat",
        "perfil": "Diversao",
        "plataforma": "Steam",
        "rank": "Bronze",
        "usuario": {
          "email": "carol@yahoo.com",
          "id": 3,
          "idade": 19,
          "localizacao": "Sorocaba, SP",
          "nome": "Caroline de Prado",
          "senha": "carol123"
        }
      },
      {
        "jogo": "Outlast",
        "nick": "WumpusCrew",
        "perfil": "Casual",
        "plataforma": "Steam",
        "rank": null,
        "usuario": {
          "email": "vini@hotmail.com",
          "id": 1,
          "idade": 25,
          "localizacao": "Sao Paulo, SP",
          "nome": "Vinicius Souza",
          "senha": "fedido"
        }
      },
      {
        "jogo": "Rainbow Six Siege",
        "nick": "DeusGod",
        "perfil": "Casual",
        "plataforma": "Origin",
        "rank": "Ouro",
        "usuario": {
          "email": "vini@hotmail.com",
          "id": 1,
          "idade": 25,
          "localizacao": "Sao Paulo, SP",
          "nome": "Vinicius Souza",
          "senha": "fedido"
        }
      },
      {
        "jogo": "Rainbow Six Siege",
        "nick": "Fainne",
        "perfil": "Aspirante",
        "plataforma": "Origin",
        "rank": "Diamante",
        "usuario": {
          "email": "luana@gmail.com",
          "id": 2,
          "idade": 21,
          "localizacao": "Sao Paulo, SP",
          "nome": "Luana Pereira",
          "senha": "123456"
        }
      },
      {
        "jogo": "Vôlei",
        "nick": "Jailson",
        "perfil": "Casual",
        "plataforma": "Vida",
        "rank": "nenhum",
        "usuario": {
          "email": "jailson@gmail.com",
          "id": 5,
          "idade": 50,
          "localizacao": "Sao Paulo, SP",
          "nome": "Jailson Mendes",
          "senha": "1543421"
        }
      }
    ]
  };

  /*
  Future<Map> _getData(String path) async {
    http.Response response = await http.get(_request+path);
    return json.decode(response.body);
  }
  */

  Map _getData(String game){
    final Map players = new Map();
    List<Map> temp1 = new List();
    List<Map> temp2 = new List();
    temp2 = _pList["jogadores"];
    for (int i = 0; i < temp2.length; i++) {
      if (_pList["jogadores"][i]["jogo"].toString().toLowerCase().contains(game.toLowerCase())) {
        temp1.add(_pList["jogadores"][i]);
      }
    }
    players["jogadores"] = temp1;
    return players;
  }

  List<String> getPlayerList(String game) {
    _players = _getData(game);
    List<String> playerList = new List();
    List<Map> temp = _players["jogadores"];
    for(int index = 0; index<temp.length; index++){
      playerList.add(_players["jogadores"][index]["nick"]);
    }
    return playerList;
  }

  Map getPlayerProfile(int index){
    return _players["jogadores"][index];
  }



}
