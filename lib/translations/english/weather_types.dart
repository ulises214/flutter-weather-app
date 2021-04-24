part of translations;

class EnglishWeatherTypesTranslations extends WeatherTypesTranslations {
  EnglishWeatherTypesTranslations()
      : super(weather: {
          WeatherTypes.CLEAR: 'Clear',
          WeatherTypes.THUNDERSTORM: 'Thunderstorm',
          WeatherTypes.DRIZZLE: 'Drizzle',
          WeatherTypes.RAIN: 'Rainy',
          WeatherTypes.SNOW: 'Snowy',
          WeatherTypes.CLOUDS: 'Cloudy',
        });
}
