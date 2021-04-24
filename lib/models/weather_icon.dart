part of weather_models;

class WeatherIconName {
  final String assetImage;

  WeatherIconName._(this.assetImage);

  factory WeatherIconName.clear(ClearTypes type) =>
      WeatherIconName._(ClearIcons[type]!);

  factory WeatherIconName.thunderstorm(ThunderstormTypes type) =>
      WeatherIconName._(ThunderstormIcons[type]!);

  factory WeatherIconName.drizzle(DrizzleTypes type) =>
      WeatherIconName._(DrizzleIcons[type]!);

  factory WeatherIconName.rain(RainTypes type) =>
      WeatherIconName._(RainIcons[type]!);

  factory WeatherIconName.snow(SnowTypes type) =>
      WeatherIconName._(SnowIcons[type]!);

  factory WeatherIconName.clouds(CloudsTypes type) =>
      WeatherIconName._(CloudsIcons[type]!);
}
