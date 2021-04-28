part of pages_library;

class PageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    final weatherCtrl = Get.find<WeatherController>();
    return Obx(() {
      final appColors = themeCtrl.appColors.value;
      final mainCity = weatherCtrl.mainCity;
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: appColors.background,
          bottomNavigationBar: PageNavigation(),
          body: SafeArea(
            child: TabBarView(
              children: [
                mainCity != null
                    ? HomePage()
                    : ThemedCircularProgressIndicator(),
                FavPage(),
                mainCity != null
                    ? SettingsPage()
                    : ThemedCircularProgressIndicator(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
