part of custom_widgets;

class SettingsTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();
    return Obx(() {
      final colors = themeCtrl.appColors.value;
      final icons = themeCtrl.icons.value;

      return Container(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(LineIcons.mapMarker, color: colors.textSecondary),
                Text(
                  'Your location now',
                  style: TextStyle(color: colors.textSecondary, fontSize: 12),
                )
              ],
            ),
            Text(
              'San Fransico, California, USA',
              style: TextStyle(color: colors.text, fontSize: 14),
            ),
            Container(
              height: 200,
              child: Transform.scale(
                scale: 2,
                child: Image(
                  image: AssetImage(icons.day.x1024),
                ),
              ),
            ),
            Chip(
              backgroundColor: colors.card,
              shadowColor: colors.shadow,
              elevation: 0,
              label: Text(
                'Day',
                style: TextStyle(
                  color: colors.text,
                ),
              ),
            ),
            Text(
              '18°',
              style: TextStyle(
                color: colors.text,
                fontSize: 48,
              ),
            ),
          ],
        ),
      );
    });
  }
}
