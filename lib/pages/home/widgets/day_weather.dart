part of home_widgets;

class DayWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    final weatherCtrl = Get.find<WeatherController>();
    return Obx(
      () {
        final icons = themeCtrl.icons;
        final mainCity = weatherCtrl.mainCity!;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: mainCity.nextHours
              .map(
                (e) => NextHourWeatherDetail(
                  time: e.hour,
                  icon: icons.find(e.icon.assetImage),
                  temperature: e.temperature.formatted,
                  controller: themeCtrl,
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
  final ThemeController controller;
  const NextHourWeatherDetail({
    required this.time,
    required this.icon,
    required this.temperature,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomText.body(time, controller),
      Image(
        width: 48,
        height: 48,
        image: AssetImage(icon),
      ),
      CustomText.body(temperature, controller),
    ]);
  }
}
