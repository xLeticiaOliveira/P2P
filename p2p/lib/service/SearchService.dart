class SearchService {
  /*
	* filta uma lista com por partes de texto
	*/
  List<String> fillteredSearch(List<String> results, String filtter) {
    return results
        .where((result) => result.toLowerCase().contains(filtter))
        .toList();
  }
}
