part of home_widgets;

class DayWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    return Obx(
      () {
        final icons = themeCtrl.icons.value;
        final textColor = themeCtrl.appColors.value.text;
        final cloudyDay = icons.cloudyDay.x1024,
            day = icons.day.x1024,
            cloudy = icons.cloudy.x1024;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DayWeatherDetail(
                time: '10 AM',
                icon: cloudyDay,
                temperature: '19°',
                textColor: textColor),
            DayWeatherDetail(
                time: '11 AM',
                icon: day,
                temperature: '22°',
                textColor: textColor),
            DayWeatherDetail(
                time: '12 AM',
                icon: cloudyDay,
                temperature: '21°',
                textColor: textColor),
            DayWeatherDetail(
                time: '01 PM',
                icon: cloudy,
                temperature: '18°',
                textColor: textColor),
            DayWeatherDetail(
                time: '02 PM',
                icon: cloudy,
                temperature: '17°',
                textColor: textColor),
          ],
        );
      },
    );
  }
}

class DayWeatherDetail extends StatelessWidget {
  final String time;
  final String icon;
  final String temperature;
  final Color textColor;
  const DayWeatherDetail({
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
        style: TextStyle(color: textColor, fontSize: 16),
      ),
    ]);
  }
}
