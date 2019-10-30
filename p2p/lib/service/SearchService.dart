class SearchService {

	//========================================================================================
	/*                                                                                      *
	* Buscar uma lista de resultados da api                                                *
	*                                                                                      */
	//========================================================================================
	List<String> getSearched(){
		return ["Rainbow Six Siege", "Outlast", "Rocket League", "Vôlei"];
	}

	//========================================================================================
	/*                                                                                      *
	* filta uma lista com por partes de texto                                              *
	*                                                                                      */
	//========================================================================================

	List<String> fillteredSearch(List<String> results, String filtter){
		return results.where((result) => result.contains(filtter));
	}

}