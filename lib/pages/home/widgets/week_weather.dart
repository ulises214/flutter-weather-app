part of home_widgets;

class WeekWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    final weatherCtrl = Get.find<WeatherController>();
    final languageCtrl = Get.find<LanguageController>();
    return Obx(() {
      final colors = themeCtrl.appColors.value;
      final icons = themeCtrl.icons.value;
      final translations = languageCtrl.translations.value;
      final mainCity = weatherCtrl.mainCity!;
      return Column(
          children: mainCity.nextDays
              .map(
                (e) => NexDayWeather(
                  day: translations.weekDays.days[e.day]!,
                  icon: icons.find(e.icon.assetImage).x1024,
                  maxTemp: e.maxTemp.formatted,
                  minTemp: e.minTemp.formatted,
                  textColor: colors.text,
                  textColorSecondary: colors.textSecondary,
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
  final Color textColor;
  final Color textColorSecondary;

  const NexDayWeather({
    required this.day,
    required this.icon,
    required this.maxTemp,
    required this.minTemp,
    required this.textColor,
    required this.textColorSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          child: Text(
            day,
            style: TextStyle(color: textColor),
          ),
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
              child: Text(
                maxTemp,
                style: TextStyle(color: textColor, fontSize: 16),
              ),
            ),
            Text(
              minTemp,
              style: TextStyle(color: textColorSecondary, fontSize: 16),
            ),
          ],
        )
      ],
    );
  }
}
