part of pages_library;

final List<Map<String, String>> citiesWeather = [
  {
    'temp': '22°',
    'city': 'Austin',
    'country': 'USA',
    'iconImage': 'day',
    'rain': '17%',
    'wind': '7km/h'
  },
  {
    'temp': '-5°',
    'city': 'New York',
    'country': 'USA',
    'iconImage': 'snowy1',
    'rain': '17%',
    'wind': '7km/h'
  },
  {
    'temp': '20°',
    'city': 'Jakarta',
    'country': 'INA',
    'iconImage': 'cloudyDay',
    'rain': '27%',
    'wind': '20km/h'
  },
  {
    'temp': '16°',
    'city': 'Tokyo',
    'country': 'JPN',
    'iconImage': 'rainy1',
    'rain': '17%',
    'wind': '7km/h'
  },
];

class FavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    final languageCtrl = Get.find<LanguageController>();

    return Obx(() {
      final colors = themeCtrl.appColors.value;
      final icons = themeCtrl.icons.value;
      final translations = languageCtrl.translations.value.favPage;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  LineIcons.search,
                  color: colors.icon,
                ),
                Flexible(
                  child: TextField(
                    style: TextStyle(color: colors.text),
                    cursorColor: colors.accent,
                    decoration: InputDecoration(
                      fillColor: colors.background,
                      hintText: translations.search,
                      hintStyle: TextStyle(color: colors.textSecondary),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    ),
                  ),
                ),
                Icon(
                  LineIcons.pen,
                  color: colors.icon,
                ),
              ],
            ),
            Flexible(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: citiesWeather.length,
                itemBuilder: (_, i) {
                  final e = citiesWeather[i];
                  return CityWeather(
                      temp: e['temp']!,
                      city: e['city']!,
                      country: e['country']!,
                      iconImage: icons.find(e['iconImage']!).x128,
                      rain: e['rain']!,
                      wind: e['wind']!);
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
