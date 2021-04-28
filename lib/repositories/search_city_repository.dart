part of repositories_library;

abstract class SearchCityRepository {
  Future<List<SearchableCity>> searchByQuery(String query, [int count = 30]);
}
