part of custom_widgets;

class WeatherTypeChip extends StatelessWidget {
  final themeCtrl = Get.find<ThemeController>();
  final languageCtrl = Get.find<LanguageController>();
  final weatherCtrl = Get.find<WeatherController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final colors = themeCtrl.appColors.value;
      final translations = languageCtrl.translations.value;
      final mainCityWeather = weatherCtrl.mainCity!;
      return Chip(
        backgroundColor: colors.card,
        shadowColor: colors.shadow,
        elevation: 0,
        label: Text(
          translations.weatherTypes.weather[mainCityWeather.weatherType]!,
          style: TextStyle(
            color: colors.text,
          ),
        ),
      );
    });
  }
}
