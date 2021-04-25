part of settings_widgets;

class SettingOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    final languageCtrl = Get.find<LanguageController>();
    final measurementCtrl = Get.find<MeasurementController>();

    return Obx(() {
      final translations = languageCtrl.translations.value.settingsPage;
      final currentLanguage = languageCtrl.currentLanguage.value;
      final measurementUnits = measurementCtrl.units.value;
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
              onClick: measurementCtrl.alternate,
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
      final colors = themeCtrl.appColors.value;
      return GestureDetector(
        onTap: onClick,
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  opt,
                  style: TextStyle(color: colors.text),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        value,
                        style: TextStyle(color: colors.textSecondary),
                      ),
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
        ),
      );
    });
  }
}
