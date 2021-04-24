part of weather_models;

class TranslationsModel {
  late final WeekDaysTranslations weekDays;
  late final WeatherTypesTranslations weatherTypes;
  late final HomePageTranslations homePage;
  late final FavPageTranslations favPage;
  late final SettingsPageTranslations settingsPage;
  TranslationsModel(Languages language) {
    switch (language) {
      case Languages.ENGLISH:
        weekDays = EnglishWeekDaysTranslations();
        weatherTypes = EnglishWeatherTypesTranslations();
        homePage = EnglishHomePageTranslations();
        favPage = EnglishFavPageTranslations();
        settingsPage = EnglishSettingsPageTranslations();
        break;
      case Languages.SPANISH:
        weekDays = SpanishWeekDaysTranslations();
        weatherTypes = SpanishWeatherTypesTranslations();
        homePage = SpanishHomePageTranslations();
        favPage = SpanishFavPageTranslations();
        settingsPage = SpanishSettingsPageTranslations();
        break;
    }
  }
}
