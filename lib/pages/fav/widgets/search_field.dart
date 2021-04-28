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
      final colors = themeCtrl.appColors.value;
      final icons = themeCtrl.icons.value;
      final translations = languageCtrl.translations.value.favPage;
      final citiesFound = secondCitiesCtrl.citiesFound;
      return FloatingSearchBar(
        body: Padding(
          padding: const EdgeInsets.only(top: 64.0),
          child: CitiesWeatherList(),
        ),
        hint: translations.search,
        scrollPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        backgroundColor: colors.background,
        shadowColor: colors.shadow,
        iconColor: colors.text,
        accentColor: colors.accent,
        border: BorderSide.none,
        hintStyle: TextStyle(color: colors.text),
        queryStyle: TextStyle(color: colors.text),
        borderRadius: BorderRadius.zero,
        backdropColor: colors.card,
        controller: searchInputController,
        debounceDelay: const Duration(milliseconds: 500),
        clearQueryOnClose: true,
        onQueryChanged: (query) {
          secondCitiesCtrl.search(query);
        },
        onSubmitted: (what) {},
        // Specify a custom transition to be used for
        // animating between opened and closed stated.
        transition: ExpandingFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction(
            showIfOpened: false,
            child: CircularButton(
              icon: const Icon(LineIcons.mapMarker),
              onPressed: () {},
            ),
          ),
          FloatingSearchBarAction.back(
            showIfClosed: false,
          ),
        ],
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              borderOnForeground: false,
              color: colors.background,
              elevation: 4.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: citiesFound.length != 0
                    ? citiesFound
                        .map(
                          (c) => SearchItem(
                            city: c,
                            colorText: colors.text,
                            backgroundColor: colors.card,
                            themedIcons: icons,
                            onClick: () {
                              searchInputController.clear();
                              searchInputController.close();
                              weatherCtrl.appendSecondaryCity(c);
                            },
                          ),
                        )
                        .toList()
                    : [
                        Container(
                          color: colors.background,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ThemedCircularProgressIndicator(),
                          ),
                        )
                      ],
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
