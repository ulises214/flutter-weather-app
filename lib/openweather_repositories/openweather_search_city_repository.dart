part of openweather_repositories_library;

class OpenWeatherSearchCityRepository extends SearchCityRepository {
  @override
  Future<List<SearchableCity>> searchByQuery(String query,
      [int count = 30]) async {
    if (query.length < 3) throw new ErrorDescription('Query so short');
    final reqUri = _getSearchCityUriByQuery(query, count);
    // print(reqUri);
    final res = (await http.get(reqUri));
    final parsedList = jsonDecode(res.body);

    return parsedList['list']
        .map<SearchableCity>(
          (c) => SearchableCity(
            location: LocationModel(c['id'], c['name'], c['sys']['country']),
            iconName: _weatherCodeToIcon(
              c['weather'][0]['id'],
            ),
          ),
        )
        .toList();
  }
}
