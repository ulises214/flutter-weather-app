part of fav_widgets;

class EmptyCities extends StatelessWidget {
  final themeCtrl = Get.find<ThemeController>();
  final languageCtrl = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final noWeatherIcon = themeCtrl.icons.value.noWeather.x1024;
      final colors = themeCtrl.appColors.value;
      final noWeatherText = languageCtrl.translations.value.favPage.noWeather;
      return Container(
        child: Column(
          children: [
            Image(
              image: AssetImage(noWeatherIcon),
              color: colors.icon,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  noWeatherText,
                  style: TextStyle(color: colors.text, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
