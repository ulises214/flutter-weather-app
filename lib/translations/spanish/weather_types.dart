part of translations;

class SpanishWeatherTypesTranslations extends WeatherTypesTranslations {
  SpanishWeatherTypesTranslations()
      : super(weather: {
          WeatherTypes.CLEAR: 'Despejado',
          WeatherTypes.THUNDERSTORM: 'Tormenta',
          WeatherTypes.DRIZZLE: 'Llovizna',
          WeatherTypes.RAIN: 'Lloviendo',
          WeatherTypes.SNOW: 'Nevando',
          WeatherTypes.CLOUDS: 'Nublado',
        });
}
