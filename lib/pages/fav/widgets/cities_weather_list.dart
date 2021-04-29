part of fav_widgets;

class CitiesWeatherList extends StatelessWidget {
  final themeCtrl = Get.find<ThemeController>();
  final weatherCtrl = Get.find<WeatherController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final icons = themeCtrl.icons;
      final secondaryCities = weatherCtrl.secondaryCities;
      return secondaryCities.length != 0
          ? ReorderableListView.builder(
              onReorder: (start, current) {
                weatherCtrl.reOrderSecondaryList(start, current);
              },
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: secondaryCities.length,
              itemBuilder: (_, i) {
                final e = secondaryCities[i];
                return CityWeather(
                  key: Key(e.location.longLocation),
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
