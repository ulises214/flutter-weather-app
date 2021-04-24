part of weather_models;

class SecondaryCityModel {
  final LocationModel location;
  final TemperatureModel temperature;
  final HumidityModel humidity;
  final WindSpeedModel windSpeed;
  SecondaryCityModel({
    required this.location,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
  });
  SecondaryCityModel copyWithDifferentUnit(MeasurementUnits newUnit) {
    return SecondaryCityModel(
      location: location,
      temperature: temperature.copyWithDifferentUnit(newUnit),
      humidity: humidity,
      windSpeed: windSpeed.copyWithDifferentUnit(newUnit),
    );
  }
}
