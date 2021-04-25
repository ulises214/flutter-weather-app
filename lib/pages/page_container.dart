part of pages_library;

class PageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();

    return Obx(() {
      final appColors = themeCtrl.appColors.value;

      return DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: appColors.background,
          bottomNavigationBar: PageNavigation(),
          body: SafeArea(
            child: TabBarView(
              children: [
                HomePage(),
                FavPage(),
                SettingsPage(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
