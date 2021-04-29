part of pages_library;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    final languageCtrl = Get.find<LanguageController>();
    return Obx(
      () {
        final translations = languageCtrl.translations.homePage;
        return Column(
          children: [
            TopBar(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Stats(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: TimeLine(),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 32.0, bottom: 16.0),
                          child: CustomText.bodySecondary(
                            translations.today,
                            themeCtrl,
                          ),
                        ),
                      ),
                      DayWeather(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 16.0,
                    ),
                    child: WeekWeather(),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
