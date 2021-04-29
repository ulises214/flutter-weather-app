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
    final pressure = PressureModel(json['current']['pressure']);
    final iconName = _weatherCodeToIcon(json['current']['weather'][0]['id']);
    final nextHours = _parseNextHours(json, units);
    final nextDays = _parseNextDays(json, units);
    final weatherType = _weatherCodeToType(json['current']['weather'][0]['id']);
    final timeZone = json['timezone_offset'];
    final sunrise = SunTime(json['current']['sunrise'], timeZone);
    final sunset = SunTime(json['current']['sunset'], timeZone);

    return MainCityModel(
        location: location,
        temperature: temp,
        weatherType: weatherType,
        humidity: humidity,
        windSpeed: windSpeed,
        pressure: pressure,
        iconName: iconName,
        nextHours: nextHours,
        nextDays: nextDays,
        sunrise: sunrise,
        sunset: sunset);
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

List<HourWeatherModel> _parseNextHours(dynamic json, MeasurementUnits units) {
  var currDate = DateTime.now();
  var formatter = DateFormat.j();
  // ? Use only 5 next hours
  final List<HourWeatherModel> nextHours = [];
  json['hourly'].take(5).forEach((h) {
    currDate = currDate.add(Duration(hours: 1));
    nextHours.add(HourWeatherModel(
      hour: formatter.format(currDate),
      icon: _weatherCodeToIcon(h['weather'][0]['id']),
      temperature: CurrentTemperatureModel(units, h['temp']),
    ));
  });
  return nextHours;
}

List<NextDayWeatherModel> _parseNextDays(dynamic json, MeasurementUnits units) {
  var currDate = DateTime.now();
  // ? Use only 3 next days
  final List<NextDayWeatherModel> nextDays = [];
  json['daily'].take(3).forEach((d) {
    currDate = currDate.add(Duration(days: 1));
    nextDays.add(NextDayWeatherModel(
      day: WeekDays.values[currDate.weekday - 1],
      icon: _weatherCodeToIcon(d['weather'][0]['id']),
      maxTemp: CurrentTemperatureModel(units, d['temp']['max']),
      minTemp: CurrentTemperatureModel(units, d['temp']['min']),
    ));
  });
  return nextDays;
}
