part of custom_widgets;

class CityWeather extends StatelessWidget {
  final String temp;
  final String city;
  final String country;
  final String iconImage;
  final String rain;
  final String wind;
  CityWeather({
    required this.temp,
    required this.city,
    required this.country,
    required this.iconImage,
    required this.rain,
    required this.wind,
  });
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    return Obx(() {
      final colors = themeCtrl.appColors.value;

      return Container(
        decoration: BoxDecoration(
            color: colors.card,
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        temp,
                        style: TextStyle(
                          fontSize: 32,
                          color: colors.text,
                        ),
                      ),
                      Text(
                        city,
                        style: TextStyle(
                          fontSize: 14,
                          color: colors.text,
                        ),
                      ),
                      Text(
                        country,
                        style: TextStyle(
                          fontSize: 14,
                          color: colors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  Image(width: 80, height: 80, image: AssetImage(iconImage))
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
      );
    });
  }
}
