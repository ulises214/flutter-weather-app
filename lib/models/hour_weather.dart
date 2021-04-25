part of weather_models;

class HourWeatherModel {
  final String hour;
  final WeatherIconName icon;
  final TemperatureModel temperature;

  HourWeatherModel({
    required this.hour,
    required this.icon,
    required this.temperature,
  });
  HourWeatherModel copyWithDifferentUnit(MeasurementUnits newUnit) =>
      HourWeatherModel(
        hour: hour,
        icon: icon,
        temperature: temperature.copyWithDifferentUnit(newUnit),
      );
}
