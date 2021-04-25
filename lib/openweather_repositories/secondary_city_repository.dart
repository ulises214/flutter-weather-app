part of openweather_repositories_library;

class OpenWeatherSecondadyCityWeatherRepository
    extends SecondadyCityWeatherRepository {
  @override
  Future<SecondaryCityModel> getByCityId(
      String cityId, MeasurementUnits units) async {
    final reqUri = _getSecondaryCityUriById(cityId, units);
    final res = (await http.get(reqUri));
    return _parseJson(jsonDecode(res.body), units);
  }

  @override
  Future<SecondaryCityModel> getByCoords(
      double lat, double lon, MeasurementUnits units) async {
    final reqUri = _getSecondaryCityUriByCoords(lat, lon, units);
    final res = (await http.get(reqUri));
    return _parseJson(jsonDecode(res.body), units);
  }

  SecondaryCityModel _parseJson(dynamic json, MeasurementUnits units) {
    final location =
        LocationModel(json['id'], json['name'], json['sys']['country']);
    final temp = CurrentTemperatureModel(units, json['main']['temp']);
    final humidity = HumidityModel(json['main']['humidity']);
    final windSpeed = WindSpeedModel(units, json['wind']['speed']);
    return SecondaryCityModel(
      location: location,
      temperature: temp,
      humidity: humidity,
      windSpeed: windSpeed,
    );
  }
}
