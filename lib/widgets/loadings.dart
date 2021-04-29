part of custom_widgets;

class ThemedCircularProgressIndicator extends StatelessWidget {
  final themeCtrl = Get.find<ThemeController>();
  final bool tiny;

  ThemedCircularProgressIndicator({this.tiny: false});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final colors = themeCtrl.appColors;
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: colors.background,
          strokeWidth: tiny ? 3 : 5,
          valueColor: AlwaysStoppedAnimation<Color>(colors.accent),
        ),
      );
    });
  }
}
