part of custom_widgets;

class Stats extends StatelessWidget {
  final weatherCtrl = Get.find<WeatherController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final mainCityWeather = weatherCtrl.mainCity!;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stat(
              text: mainCityWeather.humidity.formatted,
              icon: WeatherIcons.raindrop),
          Stat(
              text: mainCityWeather.pressure.formate,
              icon: WeatherIcons.time_12),
          Stat(
            text: mainCityWeather.windSpeed.formatted,
            icon: WeatherIcons.windy,
            extraPadding: 8,
          ),
        ],
      );
    });
  }
}

class Stat extends StatelessWidget {
  const Stat({
    required this.icon,
    required this.text,
    this.extraPadding = 0,
    this.tiny = false,
  });
  final String text;
  final IconData icon;
  final double extraPadding;
  final bool tiny;
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();

    return Obx(
      () {
        final colors = themeCtrl.appColors;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              icon,
              color: colors.icon,
              size: 24,
            ),
            Padding(
              padding: tiny
                  ? EdgeInsets.zero
                  : EdgeInsets.only(left: 8.0 + extraPadding),
              child: CustomText.body(text, themeCtrl),
            ),
          ],
        );
      },
    );
  }
}
