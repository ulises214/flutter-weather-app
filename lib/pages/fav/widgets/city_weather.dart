part of fav_widgets;

class CityWeather extends StatelessWidget {
  final String temp;
  final String city;
  final String country;
  final String iconImage;
  final String rain;
  final String wind;

  CityWeather({
    Key? key,
    required this.temp,
    required this.city,
    required this.country,
    required this.iconImage,
    required this.rain,
    required this.wind,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    return Obx(() {
      final colors = themeCtrl.appColors;
      return Card(
          color: colors.card,
          shadowColor: colors.shadow,
          elevation: 4,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.temperatureSubtitle(temp, themeCtrl),
                          CustomText.body(city, themeCtrl),
                          CustomText.bodySecondary(country, themeCtrl),
                        ],
                      ),
                      Image(width: 90, height: 90, image: AssetImage(iconImage))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stat(
                        icon: WeatherIcons.raindrop,
                        text: rain,
                        tiny: true,
                      ),
                      Stat(
                        icon: WeatherIcons.windy,
                        text: wind,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
