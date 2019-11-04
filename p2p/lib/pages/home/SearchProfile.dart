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
        title: Text('Next Match'),
        backgroundColor: Colors.cyanAccent[700],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.person,
              size: 120,
              color: Colors.cyanAccent[700],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  pData.nick,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyanAccent[700]),
                ),
              ],
            ),
            Text(
              pData.nome,
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]),
            ),
            Divider(),
            Text(
              "Dados:",
              style: TextStyle(fontSize: 20, color: Colors.grey[800]),
            ),
            Text("Cidade: " + pData.localizacao),
            Text("Idade: " + pData.idade.toString() + " anos"),
            Divider(),
            Text(
              "Jogos:",
              style: TextStyle(fontSize: 20, color: Colors.grey[800]),
            ),
            Text(pData.jogo),
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
