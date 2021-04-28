part of controllers_library;

class SearchCitiesController extends GetxController {
  final RxList<SearchableCity> _citiesFound = RxList<SearchableCity>();
  final SearchCityRepository _searchCityRepository =
      OpenWeatherSearchCityRepository();

  List<SearchableCity> get citiesFound =>
      _citiesFound.map<SearchableCity>((c) => c).toList();

  void search(String query) async {
    try {
      final cities = await _searchCityRepository.searchByQuery(query);
      _citiesFound.assignAll(cities);
    } catch (e) {
      print('Whaaaaaaat$e');
    }
  }

  void clearCitiesFound() {
    _citiesFound.clear();
  }
}
