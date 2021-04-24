part of custom_widgets;

class Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stat(text: '13%', icon: WeatherIcons.raindrop),
        Stat(text: '0.533 mBar', icon: WeatherIcons.time_12),
        Stat(
          text: '9km/h',
          icon: WeatherIcons.strong_wind,
          extraPadding: 8,
        ),
      ],
    );
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
        final colors = themeCtrl.appColors.value;
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
              child: Text(text, style: TextStyle(color: colors.text)),
            ),
          ],
        );
      },
    );
  }
}
