part of weather_models;

class MainCityModel {
  final LocationModel location;
  final TemperatureModel temperature;
  final HumidityModel humidity;
  final WindSpeedModel windSpeed;
  final PressureModel pressure;
  final WeatherIconName iconName;
  MainCityModel({
    required this.location,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
    required this.iconName,
  });
  MainCityModel copyWithDifferentUnit(MeasurementUnits newUnit) {
    return MainCityModel(
      location: location,
      temperature: temperature.copyWithDifferentUnit(newUnit),
      humidity: humidity,
      windSpeed: windSpeed.copyWithDifferentUnit(newUnit),
      pressure: pressure,
      iconName: iconName,
    );
  }
}
