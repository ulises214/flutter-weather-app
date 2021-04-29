part of settings_widgets;

class SettingOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    final languageCtrl = Get.find<LanguageController>();
    final weatherCtrl = Get.find<WeatherController>();
    return Obx(() {
      final translations = languageCtrl.translations.settingsPage;
      final currentLanguage = languageCtrl.currentLanguage;
      final measurementUnits = weatherCtrl.units;
      return Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _SettingsItem(
              opt: translations.languageTitle,
              value: currentLanguage,
              onClick: languageCtrl.alternate,
            ),
            _SettingsItem(
              opt: translations.measurementUnitsTitle,
              value: translations.measurementUnitsOptions[measurementUnits]!,
              onClick: weatherCtrl.alternateUnits,
            ),
            _SettingsItem(
              opt: translations.themeTitle,
              value: translations.themeOptions[themeCtrl.currentTheme]!,
              onClick: themeCtrl.toggle,
            ),
          ],
        ),
      );
    });
  }
}

class _SettingsItem extends StatelessWidget {
  final String opt;
  final String value;
  final VoidCallback? onClick;
  const _SettingsItem({
    required this.opt,
    required this.value,
    this.onClick,
  });
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    return Obx(() {
      final colors = themeCtrl.appColors;
      return InkWell(
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText.body(opt, themeCtrl),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomText.bodySecondary(value, themeCtrl),
                  ),
                ),
              ),
              Icon(
                LineIcons.chevronCircleRight,
                color: colors.text,
              ),
            ],
          ),
        ),
      );
    });
  }
}
