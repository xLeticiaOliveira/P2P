import 'package:flutter/material.dart';
import 'package:p2p/service/ContactService.dart';
import 'package:p2p/PlayerData.dart';

class ContactProfile extends StatelessWidget {
  ContactService service = new ContactService();
  PlayerData pData;

  ContactProfile(PlayerData data){
    pData = data;
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
        onPressed: () async {
          await service.removeMember(pData);
          Navigator.pushReplacementNamed(context,'/home', arguments: 2);
          //Navigator.of(context).pushNamed('/home', arguments: 2);
        },
        tooltip: 'Adicionar aos Contatos',
        child: const Icon(Icons.remove),
      ),
    );
  }
}