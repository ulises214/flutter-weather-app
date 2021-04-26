part of openweather_repositories_library;

WeatherIconName _weatherCodeToIcon(int id) {
  if (id >= 200 && id < 300)
    return WeatherIconName.thunderstorm(ThunderstormTypes.DEFAULT);
  else if (id >= 300 && id < 400)
    return WeatherIconName.drizzle(DrizzleTypes.DEFAULT);
  else if (id >= 500 && id < 600) {
    if (id == 500) return WeatherIconName.rain(RainTypes.LIGHT);
    if (id == 501) return WeatherIconName.rain(RainTypes.MODERATE);
    if (id <= 504) return WeatherIconName.rain(RainTypes.HEAVY);
    if (id <= 521) return WeatherIconName.rain(RainTypes.SHOWER);
    if (id <= 531) return WeatherIconName.rain(RainTypes.RAGGED);
  } else if (id >= 600 && id < 700)
    return WeatherIconName.snow(SnowTypes.DEFAULT);
  else if (id >= 700 && id < 800)
    return WeatherIconName.clouds(CloudsTypes.BROKEN);
  else if (id == 800) {
    var hour = DateTime.now().hour;
    var isDay = hour > 6 && hour <= 20;
    return WeatherIconName.clear(isDay ? ClearTypes.DAY : ClearTypes.NIGHT);
  } else if (id == 801) {
    var hour = DateTime.now().hour;
    var isDay = hour > 6 && hour <= 20;
    return WeatherIconName.clouds(isDay ? CloudsTypes.DAY : CloudsTypes.NIGHT);
  }

  return WeatherIconName.clouds(CloudsTypes.BROKEN);
}

WeatherTypes _weatherCodeToType(int id) {
  if (id >= 200 && id < 300)
    return WeatherTypes.THUNDERSTORM;
  else if (id >= 300 && id < 400)
    return WeatherTypes.DRIZZLE;
  else if (id >= 500 && id < 600)
    return WeatherTypes.RAIN;
  else if (id >= 600 && id < 700)
    return WeatherTypes.SNOW;
  else if (id >= 700 && id < 800)
    return WeatherTypes.CLOUDS;
  else if (id == 800) return WeatherTypes.CLEAR;
  return WeatherTypes.CLOUDS;
}
