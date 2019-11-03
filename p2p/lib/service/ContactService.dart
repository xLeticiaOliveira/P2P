import 'dart:convert';
import 'dart:io';

import 'package:p2p/PlayerData.dart';
import 'package:path_provider/path_provider.dart';

class ContactService {
  List _contactList = new List();

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

      return file.readAsStringSync();
    } catch (e) {
      return null;
    }
  }

  List<PlayerData> convertList(){
    List<PlayerData> nList = new List();
    for(dynamic player in _contactList){
      nList.add(new PlayerData(player));
    }
    return nList;
  }

  Future<List<PlayerData>> addMember(PlayerData player) async {
    await initContactList();
    _contactList.add(player.toMap());
    _saveData();
    return convertList();
  }

  Future<void> removeMember(PlayerData player) async{
    await initContactList();
    for(dynamic p in _contactList){
      if(p["nick"]==player.nick){
        _contactList.remove(p);
        await _saveData();
        break;
      }
    }
  }

  Future<bool> inContact(PlayerData player) async {
    await initContactList();
    bool exists = false;
    for(dynamic player in _contactList){
      if(player["nick"]==player.nick){
        exists = true;
        break;
      }
    }
    return exists;
  }


  Future<List<PlayerData>> initContactList() async {
      String data = await _readData();
      if(data == null){
        data = "[]";
      }
      _contactList = json.decode(data);
      print(_contactList.toString());
      return convertList();
  }
}