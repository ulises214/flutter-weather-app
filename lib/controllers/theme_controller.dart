part of controllers_library;

class ThemeController extends GetxController {
  late final Rx<AppColors> appColors;
  late final Rx<ThemedIcons> icons;
  late final Rx<Brightness> brightness;
  late final Rx<String> currentTheme;
  late ThemeColor _color;

  ThemeController({ThemeColor initialTheme: ThemeColor.DARK}) {
    _color = initialTheme;
    switch (_color) {
      case ThemeColor.DARK:
        appColors = AppColors.dark().obs;
        icons = ThemedIcons.dark().obs;
        brightness = Brightness.light.obs;
        currentTheme = 'Dark'.obs;
        break;
      case ThemeColor.LIGHT:
        appColors = AppColors.light().obs;
        icons = ThemedIcons.light().obs;
        brightness = Brightness.dark.obs;
        currentTheme = 'Light'.obs;
        break;
    }
  }
  _applyChanges() {
    switch (_color) {
      case ThemeColor.DARK:
        appColors.value = AppColors.dark();
        icons.value = ThemedIcons.dark();
        brightness.value = Brightness.light;
        currentTheme.value = 'Dark';
        break;
      case ThemeColor.LIGHT:
        appColors.value = AppColors.light();
        icons.value = ThemedIcons.light();
        brightness.value = Brightness.dark;
        currentTheme.value = 'Light';
        break;
    }
  }

  change(ThemeColor color) {
    if (color == _color) return;
    toggle();
  }

  toggle() {
    switch (_color) {
      case ThemeColor.DARK:
        _color = ThemeColor.LIGHT;
        _applyChanges();
        break;
      case ThemeColor.LIGHT:
        _color = ThemeColor.DARK;
        _applyChanges();
        break;
    }
  }
}
