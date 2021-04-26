part of home_widgets;

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    final weatherCtrl = Get.find<WeatherController>();
    return Obx(
      () {
        final colors = themeCtrl.appColors.value;
        final mainCityWeather = weatherCtrl.mainCity.value!;
        return Container(
          width: double.infinity,
          height: 250,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      mainCityWeather.location.city,
                      style: TextStyle(
                        color: colors.text,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      mainCityWeather.temperature.formatedTemp,
                      style: TextStyle(
                        color: colors.text,
                        fontSize: 48,
                      ),
                    ),
                    WeatherTypeChip(),
                  ],
                ),
                Transform.scale(
                  scale: 2,
                  child: Image(
                    height: 128,
                    width: 128,
                    image: AssetImage(
                      themeCtrl.icons.value
                          .find(mainCityWeather.iconName.assetImage)
                          .x1024,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
