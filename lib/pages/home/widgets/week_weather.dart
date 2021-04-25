part of home_widgets;

class WeekWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    return Obx(() {
      final colors = themeCtrl.appColors.value;
      final icons = themeCtrl.icons.value;
      return Column(
        children: [
          WeekWeatherDetail(
            day: 'Tuesday',
            icon: icons.cloudyDay.x1024,
            maxTemp: '19°',
            minTemp: '15°',
            textColor: colors.text,
            textColorSecondary: colors.textSecondary,
          ),
          WeekWeatherDetail(
            day: 'Wednesday',
            icon: icons.cloudyDay.x1024,
            maxTemp: '19°',
            minTemp: '15°',
            textColor: colors.text,
            textColorSecondary: colors.textSecondary,
          ),
          WeekWeatherDetail(
            day: 'Thursday',
            icon: icons.day.x1024,
            maxTemp: '18°',
            minTemp: '14°',
            textColor: colors.text,
            textColorSecondary: colors.textSecondary,
          ),
        ],
      );
    });
  }
}

class WeekWeatherDetail extends StatelessWidget {
  final String day;
  final String icon;
  final String maxTemp;
  final String minTemp;
  final Color textColor;
  final Color textColorSecondary;

  const WeekWeatherDetail({
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
