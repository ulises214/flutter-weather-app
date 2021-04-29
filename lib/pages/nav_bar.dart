part of pages_library;

class PageNavigation extends StatefulWidget {
  @override
  _PageNavigationState createState() => _PageNavigationState();
}

class _PageNavigationState extends State<PageNavigation> {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: TabBar(
            labelColor: themeCtrl.appColors.accent,
            unselectedLabelColor: themeCtrl.appColors.icon,
            indicatorColor: themeCtrl.appColors.accent,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: EdgeInsets.all(4),
            tabs: [
              Icon(LineIcons.home, size: 28),
              Icon(LineIcons.heart, size: 28),
              Icon(LineIcons.bars, size: 28),
            ],
          ),
        ),
      ),
    );
  }
}
