part of controllers_library;

class LanguageController extends GetxController {
  late final Rx<TranslationsModel> _translations;
  late final Rx<String> _currentLanguage;
  Languages _language;

  LanguageController([this._language = Languages.SPANISH]) {
    _translations = TranslationsModel(_language).obs;
    _currentLanguage =
        _translations.value.settingsPage.languageOptions[_language]!.obs;
  }
  change(Languages language) {
    if (language == _language) return;
    _language = language;
    _translations.value = TranslationsModel(_language);
    _currentLanguage.value =
        _translations.value.settingsPage.languageOptions[_language]!;
  }

  alternate() {
    var nextIndex = Languages.values.indexOf(_language) + 1;
    if (nextIndex < Languages.values.length)
      change(Languages.values[nextIndex]);
    else
      change(Languages.values[0]);
  }

  TranslationsModel get translations => _translations.value;
  String get currentLanguage => _currentLanguage.value;
}
