part of home_widgets;

class WeekWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    final weatherCtrl = Get.find<WeatherController>();
    final languageCtrl = Get.find<LanguageController>();
    return Obx(() {
      final icons = themeCtrl.icons;
      final translations = languageCtrl.translations;
      final mainCity = weatherCtrl.mainCity!;
      return Column(
          children: mainCity.nextDays
              .map(
                (e) => NexDayWeather(
                  day: translations.weekDays.days[e.day]!,
                  icon: icons.find(e.icon.assetImage).x1024,
                  maxTemp: e.maxTemp.formatted,
                  minTemp: e.minTemp.formatted,
                  controller: themeCtrl,
                ),
              )
              .toList());
    });
  }
}

class NexDayWeather extends StatelessWidget {
  final String day;
  final String icon;
  final String maxTemp;
  final String minTemp;
  final ThemeController controller;

  const NexDayWeather({
    required this.day,
    required this.icon,
    required this.maxTemp,
    required this.minTemp,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          child: CustomText.body(day, controller),
        ),
        Expanded(
          child: Image(
            width: 48,
            height: 48,
            image: AssetImage(icon),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: CustomText.body(maxTemp, controller),
            ),
            CustomText.bodySecondary(minTemp, controller),
          ],
        )
      ],
    );
  }
}
