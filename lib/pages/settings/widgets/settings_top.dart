part of settings_widgets;

class SettingsTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    final languageCtrl = Get.find<LanguageController>();
    final weatherCtrl = Get.find<WeatherController>();
    return Obx(() {
      final colors = themeCtrl.appColors;
      final icons = themeCtrl.icons;
      final translations = languageCtrl.translations.settingsPage;
      final mainCity = weatherCtrl.mainCity!;
      return Container(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(LineIcons.mapMarker, color: colors.textSecondary),
                CustomText.bodySecondary(translations.locationNow, themeCtrl)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CustomText.subtitle(
                mainCity.location.longLocation,
                themeCtrl,
              ),
            ),
            Container(
              width: 200,
              child: Image(
                image: AssetImage(
                  icons.find(mainCity.iconName.assetImage),
                ),
              ),
            ),
            WeatherTypeChip(),
            CustomText.temperatureTitle(
              mainCity.temperature.pretty,
              themeCtrl,
            ),
          ],
        ),
      );
    });
  }
}
