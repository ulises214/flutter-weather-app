part of translations;

abstract class SettingsPageTranslations {
  final String locationNow;
  final String themeTitle;
  final String languageTitle;
  final String measurementUnitsTitle;
  final Map<ThemeColor, String> themeOptions;
  final Map<Languages, String> languageOptions;
  final Map<MeasurementUnits, String> measurementUnitsOptions;
  SettingsPageTranslations({
    required this.locationNow,
    required this.themeTitle,
    required this.languageTitle,
    required this.measurementUnitsTitle,
    required this.themeOptions,
    required this.languageOptions,
    required this.measurementUnitsOptions,
  });
}
