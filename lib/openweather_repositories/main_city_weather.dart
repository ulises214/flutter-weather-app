part of openweather_repositories_library;

class OpenWeatherMainCityWeatherRepository extends MainCityWeatherRepository {
  @override
  Future<MainCityModel> getByCoords(
      double lat, double lon, MeasurementUnits units) async {
    final reqUri = _getMainCityUriByCoords(lat, lon, units);

    final res = await http.get(reqUri);
    final json = jsonDecode(res.body);

    final location = await _getLocation(lat, lon, units);

    final temp = CurrentTemperatureModel(units, json['current']['temp']);
    final humidity = HumidityModel(json['current']['humidity']);
    final windSpeed = WindSpeedModel(units, json['current']['wind_speed']);
    final PressureModel pressure = PressureModel(json['current']['pressure']);
    final iconName = _weatherCodeToIcon(json['current']['weather']['id']);
    final nextHours = _parseNextHours(json);
    final nextDays = _parseNextDays(json);

    return MainCityModel(
      location: location,
      temperature: temp,
      humidity: humidity,
      windSpeed: windSpeed,
      pressure: pressure,
      iconName: iconName,
      nextHours: nextHours,
      nextDays: nextDays,
    );
  }
}

Future<LocationModel> _getLocation(
    double lat, double lon, MeasurementUnits units) async {
  final reqUri = _getSecondaryCityUriByCoords(lat, lon, units);
  final res = await http.get(reqUri);
  final rawJson = jsonDecode(res.body);
  return LocationModel(
      rawJson['id'], rawJson['name'], rawJson['sys']['country']);
}

List<HourWeatherModel> _parseNextHours(dynamic json) {
  var currDate = DateTime.now();
  var formatter = DateFormat('hma');
  final List<HourWeatherModel> nextHours = json['hourly'].map((h) {
    currDate = currDate.add(Duration(hours: 1));
    return HourWeatherModel(
      hour: formatter.format(currDate),
      icon: _weatherCodeToIcon(h['weather']['id']),
      temperature: h['temp'],
    );
  }).toList();
  return nextHours;
}

List<NextDayWeatherModel> _parseNextDays(dynamic json) {
  var currDate = DateTime.now();
  final List<NextDayWeatherModel> nextDays = json['daily'].map((d) {
    currDate = currDate.add(Duration(days: 1));
    return NextDayWeatherModel(
      day: WeekDays.values[currDate.weekday - 1],
      icon: _weatherCodeToIcon(d['weather']['id']),
      maxTemp: d['temp']['max'],
      minTemp: d['temp']['min'],
    );
  }).toList();
  return nextDays;
}
