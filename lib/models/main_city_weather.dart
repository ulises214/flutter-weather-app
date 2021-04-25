part of weather_models;

class MainCityModel {
  final LocationModel location;
  final CurrentTemperatureModel temperature;
  final HumidityModel humidity;
  final WindSpeedModel windSpeed;
  final PressureModel pressure;
  final WeatherIconName iconName;
  final List<HourWeatherModel> nextHours;
  final List<NextDayWeatherModel> nextDays;
  MainCityModel({
    required this.location,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
    required this.iconName,
    required this.nextHours,
    required this.nextDays,
  });
  MainCityModel copyWithDifferentUnit(MeasurementUnits newUnit) {
    return MainCityModel(
      location: location,
      temperature: temperature.copyWithDifferentUnit(newUnit),
      humidity: humidity,
      windSpeed: windSpeed.copyWithDifferentUnit(newUnit),
      pressure: pressure,
      iconName: iconName,
      nextHours:
          nextHours.map((n) => n.copyWithDifferentUnit(newUnit)).toList(),
      nextDays: nextDays.map((n) => n.copyWithDifferentUnit(newUnit)).toList(),
    );
  }
}
