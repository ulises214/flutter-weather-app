part of settings_widgets;

class SettingsTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    final languageCtrl = Get.find<LanguageController>();
    final weatherCtrl = Get.find<WeatherController>();
    return Obx(() {
      final colors = themeCtrl.appColors.value;
      final icons = themeCtrl.icons.value;
      final translations = languageCtrl.translations.value.settingsPage;
      final mainCity = weatherCtrl.mainCity!;
      return Container(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(LineIcons.mapMarker, color: colors.textSecondary),
                Text(
                  translations.locationNow,
                  style: TextStyle(color: colors.textSecondary, fontSize: 12),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                mainCity.location.longLocation,
                style: TextStyle(color: colors.text, fontSize: 14),
              ),
            ),
            Container(
              width: 200,
              child: Image(
                image: AssetImage(
                  icons.find(mainCity.iconName.assetImage).x1024,
                ),
              ),
            ),
            WeatherTypeChip(),
            Text(
              mainCity.temperature.pretty,
              style: TextStyle(
                color: colors.text,
                fontSize: 48,
              ),
            ),
          ],
        ),
      );
    });
  }
}
