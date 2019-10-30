import 'package:flutter/material.dart';
import 'package:p2p/pages/home/Profile.dart';
import 'package:p2p/service/GroupService.dart';

class SearchProfile extends StatelessWidget {
  List _user;

  SearchProfile(List user) {
    this._user = user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player2Player'),
        backgroundColor: Colors.cyanAccent[700],
      ),
      body: Center(
        child: Profile(_user),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          (new GroupService()).addToGroup(1, 1);
        },
        tooltip: 'Adicionar aos Contatos',
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
