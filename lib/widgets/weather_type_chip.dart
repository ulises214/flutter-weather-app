part of custom_widgets;

class WeatherTypeChip extends StatelessWidget {
  final themeCtrl = Get.find<ThemeController>();
  final languageCtrl = Get.find<LanguageController>();
  final weatherCtrl = Get.find<WeatherController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final colors = themeCtrl.appColors;
      final translations = languageCtrl.translations;
      final mainCityWeather = weatherCtrl.mainCity!;
      final weatherName =
          translations.weatherTypes.weather[mainCityWeather.weatherType]!;
      return Chip(
        side: BorderSide(color: colors.border),
        backgroundColor: colors.card,
        shadowColor: colors.shadow,
        elevation: 0,
        label: CustomText.body(weatherName, themeCtrl),
      );
    });
  }
}
