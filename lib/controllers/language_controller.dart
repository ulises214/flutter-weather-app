part of controllers_library;

class LanguageController extends GetxController {
  late final Rx<TranslationsModel> translations;
  late final Rx<String> currentLanguage;
  Languages _language;

  LanguageController([this._language = Languages.SPANISH]) {
    translations = TranslationsModel(_language).obs;
    currentLanguage =
        translations.value.settingsPage.languageOptions[_language]!.obs;
  }
  change(Languages language) {
    if (language == _language) return;
    _language = language;
    translations.value = TranslationsModel(_language);
    currentLanguage.value =
        translations.value.settingsPage.languageOptions[_language]!;
  }

  alternate() {
    var nextIndex = Languages.values.indexOf(_language) + 1;
    if (nextIndex <= Languages.values.length) change(Languages.values[0]);
    change(Languages.values[nextIndex]);
  }
}
