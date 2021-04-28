part of home_widgets;

class DayWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    final weatherCtrl = Get.find<WeatherController>();
    return Obx(
      () {
        final icons = themeCtrl.icons.value;
        final mainCity = weatherCtrl.mainCity!;
        final textColor = themeCtrl.appColors.value.text;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: mainCity.nextHours
              .map(
                (e) => NextHourWeatherDetail(
                  time: e.hour,
                  icon: icons.find(e.icon.assetImage).x1024,
                  temperature: e.temperature.formatted,
                  textColor: textColor,
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class NextHourWeatherDetail extends StatelessWidget {
  final String time;
  final String icon;
  final String temperature;
  final Color textColor;
  const NextHourWeatherDetail({
    required this.time,
    required this.icon,
    required this.temperature,
    required this.textColor,
  });
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        time,
        style: TextStyle(color: textColor, fontSize: 12),
      ),
      Image(
        width: 48,
        height: 48,
        image: AssetImage(icon),
      ),
      Text(
        temperature,
        style: TextStyle(color: textColor, fontSize: 14),
      ),
    ]);
  }
}
