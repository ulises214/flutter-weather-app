part of custom_widgets;

class ThemedCircularProgressIndicator extends StatelessWidget {
  final themeCtrl = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final colors = themeCtrl.appColors.value;
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: colors.background,
          strokeWidth: 5,
          valueColor: AlwaysStoppedAnimation<Color>(colors.accent),
        ),
      );
    });
  }
}
