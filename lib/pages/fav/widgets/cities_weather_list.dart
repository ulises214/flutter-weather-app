part of fav_widgets;

class CitiesWeatherList extends StatelessWidget {
  final themeCtrl = Get.find<ThemeController>();
  final weatherCtrl = Get.find<WeatherController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final icons = themeCtrl.icons.value;
      final secondaryCities = weatherCtrl.secondaryCities;
      return secondaryCities.length != 0
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 3 / 1,
              ),
              itemCount: secondaryCities.length,
              itemBuilder: (_, i) {
                final e = secondaryCities[i];
                return CityWeather(
                  temp: e.temperature.formatted,
                  city: e.location.city,
                  country: e.location.country,
                  iconImage: icons.find(e.iconName.assetImage).x128,
                  rain: e.humidity.formatted,
                  wind: e.windSpeed.formatted,
                );
              },
            )
          : EmptyCities();
    });
  }
}
