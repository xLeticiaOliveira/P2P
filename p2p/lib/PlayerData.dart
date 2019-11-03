class PlayerData{

  String jogo;
  String nick;
  String plataforma;
  String rank;
  int idade;
  String localizacao;
  String nome;

  PlayerData(Map user){
    this.jogo = user["jogo"];
    this.nick = user["nick"];
    this.plataforma = user["plataforma"];
    this.rank = user["rank"];
    this.idade = user["usuario"]["idade"];
    this.localizacao = user["usuario"]["localizacao"];
    this.nome = user["usuario"]["nome"];
  }

}