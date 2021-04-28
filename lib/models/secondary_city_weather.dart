part of weather_models;

class SecondaryCityModel {
  final LocationModel location;
  final CurrentTemperatureModel temperature;
  final HumidityModel humidity;
  final WindSpeedModel windSpeed;
  final WeatherIconName iconName;
  SecondaryCityModel({
    required this.location,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.iconName,
  });
  SecondaryCityModel copyWithDifferentUnit(MeasurementUnits newUnit) {
    return SecondaryCityModel(
      location: location,
      temperature: temperature.copyWithDifferentUnit(newUnit),
      humidity: humidity,
      windSpeed: windSpeed.copyWithDifferentUnit(newUnit),
      iconName: iconName,
    );
  }
}
