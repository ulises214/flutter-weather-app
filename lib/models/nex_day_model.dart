part of weather_models;

class NextDayWeatherModel {
  final WeekDays day;
  final WeatherIconName icon;
  final CurrentTemperatureModel maxTemp;
  final CurrentTemperatureModel minTemp;
  NextDayWeatherModel({
    required this.day,
    required this.icon,
    required this.maxTemp,
    required this.minTemp,
  });
  NextDayWeatherModel copyWithDifferentUnit(MeasurementUnits newUnit) =>
      NextDayWeatherModel(
        day: day,
        icon: icon,
        maxTemp: maxTemp.copyWithDifferentUnit(newUnit),
        minTemp: minTemp.copyWithDifferentUnit(newUnit),
      );
}
