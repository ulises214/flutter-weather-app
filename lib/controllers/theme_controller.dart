part of controllers_library;

class ThemeController extends GetxController {
  late final Rx<AppColors> _appColors;
  late final Rx<ThemedIcons> _icons;
  late final Rx<Brightness> _brightness;

  late ThemeColor _color;

  ThemeController({ThemeColor initialTheme: ThemeColor.DARK}) {
    _color = initialTheme;
    switch (_color) {
      case ThemeColor.DARK:
        _appColors = AppColors.dark().obs;
        _icons = ThemedIcons.dark().obs;
        _brightness = Brightness.light.obs;
        break;
      case ThemeColor.LIGHT:
        _appColors = AppColors.light().obs;
        _icons = ThemedIcons.light().obs;
        _brightness = Brightness.dark.obs;
        break;
    }
  }
  _applyChanges() {
    switch (_color) {
      case ThemeColor.DARK:
        _appColors.value = AppColors.dark();
        _icons.value = ThemedIcons.dark();
        _brightness.value = Brightness.light;
        break;
      case ThemeColor.LIGHT:
        _appColors.value = AppColors.light();
        _icons.value = ThemedIcons.light();
        _brightness.value = Brightness.dark;
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

  ThemeColor get currentTheme => _color;
  AppColors get appColors => _appColors.value;
  ThemedIcons get icons => _icons.value;
  Brightness get brightness => _brightness.value;
}
