part of translations;

class EnglishSettingsPageTranslations extends SettingsPageTranslations {
  EnglishSettingsPageTranslations()
      : super(
          locationNow: 'Your location now',
          themeTitle: 'Theme',
          languageTitle: 'Language',
          measurementUnitsTitle: 'Units',
          themeOptions: {
            ThemeColor.DARK: 'Dark',
            ThemeColor.LIGHT: 'Light',
          },
          languageOptions: {
            Languages.ENGLISH: 'English',
            Languages.SPANISH: 'Spanish',
          },
          measurementUnitsOptions: {
            MeasurementUnits.IMPERIAL: 'Imperial',
            // MeasurementUnits.STANDAR: 'Standar',
            MeasurementUnits.METRIC: 'Metric',
          },
        );
}
