part of translations;

class SpanishSettingsPageTranslations extends SettingsPageTranslations {
  SpanishSettingsPageTranslations()
      : super(
          locationNow: 'Tu ubicación ahora',
          themeTitle: 'Tema',
          languageTitle: 'Idioma',
          measurementUnitsTitle: 'Unidades',
          themeOptions: {
            ThemeColor.DARK: 'Oscuro',
            ThemeColor.LIGHT: 'Claro',
          },
          languageOptions: {
            Languages.ENGLISH: 'Inglés',
            Languages.SPANISH: 'Español',
          },
          measurementUnitsOptions: {
            MeasurementUnits.IMPERIAL: 'Imperial',
            MeasurementUnits.STANDAR: 'Estándar',
            MeasurementUnits.METRIC: 'Métrico',
          },
        );
}
