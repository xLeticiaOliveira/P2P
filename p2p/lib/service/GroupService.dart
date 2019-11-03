class GroupService {

  /*
   * Adiciona usuario ao grupo
   */
  void addToGroup(user, group){

  }

  /*
   * Obtem todos os Grupos da Api
   */
  List <String> getGroups(){
    return ["Rainbow Six Siege", "Outlast", "Rocket League", "Vôlei"];
  }

  /*
   * Obtem todos os Grupos que o usuario participa
   */
  List <String> getUserGroups(int userId){
    return ["Jose", "Rothbard", "Samuel", "Marcelo"];
  }


}