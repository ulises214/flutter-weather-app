part of fav_widgets;

class CitySearchField extends StatelessWidget {
  final themeCtrl = Get.find<ThemeController>();
  final languageCtrl = Get.find<LanguageController>();
  final secondCitiesCtrl = Get.find<SearchCitiesController>();
  final weatherCtrl = Get.find<WeatherController>();

  final searchInputController = FloatingSearchBarController();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final colors = themeCtrl.appColors;
      final translations = languageCtrl.translations.favPage;
      final citiesFound = secondCitiesCtrl.citiesFound;
      return FloatingSearchBar(
        accentColor: colors.accent,
        backdropColor: Colors.transparent,
        backgroundColor: colors.card,
        border: BorderSide(color: colors.card),
        borderRadius: BorderRadius.circular(15),
        clearQueryOnClose: true,
        controller: searchInputController,
        debounceDelay: const Duration(milliseconds: 500),
        elevation: 8,
        hint: translations.search,
        hintStyle: Theme.of(context).textTheme.bodyText2,
        iconColor: colors.text,
        onQueryChanged: (query) {},
        onSubmitted: (query) {
          secondCitiesCtrl.clearCitiesFound();
          secondCitiesCtrl.search(query);
        },
        queryStyle: Theme.of(context).textTheme.bodyText1,
        transition: SlideFadeFloatingSearchBarTransition(translation: 16),
        body: Padding(
          padding: const EdgeInsets.only(top: 72.0),
          child: CitiesWeatherList(),
        ),
        actions: [
          FloatingSearchBarAction(
            showIfOpened: false,
            child: CircularButton(
              icon: const Icon(LineIcons.mapMarker),
              onPressed: () {
                searchInputController.open();
              },
            ),
          ),
          FloatingSearchBarAction.back(
            showIfClosed: false,
          ),
        ],
        builder: (context, transition) {
          return Material(
            borderOnForeground: false,
            color: Colors.transparent,
            shadowColor: colors.shadow,
            borderRadius: BorderRadius.circular(16),
            elevation: 8,
            child: Container(
              decoration: BoxDecoration(
                  color: colors.background,
                  border: Border.all(color: colors.card),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: citiesFound.length != 0
                    ? citiesFound
                        .map(
                          (c) => SearchItem(
                            city: c,
                            controller: themeCtrl,
                            onClick: () {
                              searchInputController.close();
                              weatherCtrl.appendSecondaryCity(c);
                              secondCitiesCtrl.clearCitiesFound();
                            },
                          ),
                        )
                        .toList()
                    : [_notCities()],
              ),
            ),
          );
        },
      );
    });
  }
}

// TextField(
//               style: TextStyle(color: colors.text),
//               cursorColor: colors.accent,
//               decoration: InputDecoration(
//                 fillColor: colors.background,
//                 hintText: translations.search,
//                 hintStyle: TextStyle(color: colors.textSecondary),
//                 border: InputBorder.none,
//                 focusedBorder: InputBorder.none,
//                 enabledBorder: InputBorder.none,
//                 disabledBorder: InputBorder.none,
//                 contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
//               ),
//             ),
Widget _notCities() => Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ThemedCircularProgressIndicator(
          tiny: true,
        ),
      ),
    );
