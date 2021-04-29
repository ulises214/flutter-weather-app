part of home_widgets;

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    final weatherCtrl = Get.find<WeatherController>();
    return Obx(
      () {
        final mainCityWeather = weatherCtrl.mainCity!;
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
                    CustomText.title(mainCityWeather.location.city, themeCtrl),
                    CustomText.temperatureTitle(
                        mainCityWeather.temperature.pretty, themeCtrl),
                    WeatherTypeChip(),
                  ],
                ),
                Transform.scale(
                  scale: 2,
                  child: Image(
                    height: 128,
                    width: 128,
                    image: AssetImage(
                      themeCtrl.icons
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
