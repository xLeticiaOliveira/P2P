import 'package:flutter/material.dart';
import 'package:p2p/service/ContactService.dart';
import 'package:p2p/PlayerData.dart';

class SearchProfile extends StatelessWidget {
  ContactService service = new ContactService();
  PlayerData pData;

  SearchProfile(PlayerData data){
    pData = data;
  }

  Future<void> _addToContacts() async {
    await service.addMember(pData);
  }

  @override
  Widget build(BuildContext context) {
    service.initContactList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Player2Player'),
        backgroundColor: Colors.cyanAccent[700],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.person, size: 120,
              color: Colors.cyanAccent[700]),
            Text("nick: "+pData.nick,  style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800])
            ),
            Text("jogo: "+pData.jogo,  style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800])
            ),
            Text("nome: "+pData.nome,  style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800])
            ),
            Text("idade: "+pData.idade.toString(),  style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800])
            ),
            Text("localização: "+pData.localizacao,  style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800])
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addToContacts,
        tooltip: 'Adicionar aos Contatos',
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
