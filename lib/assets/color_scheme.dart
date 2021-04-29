part of assets;

class ThemedColorScheme extends ColorScheme {
  final Color primary;
  final Color primaryVariant;
  final Color secondary;
  final Color secondaryVariant;
  final Color surface;
  final Color background;
  final Color error;
  final Color onPrimary;
  final Color onSecondary;
  final Color onSurface;
  final Color onBackground;
  final Color onError;
  final Brightness brightness;
  ThemedColorScheme._({
    required this.primary,
    required this.primaryVariant,
    required this.secondary,
    required this.secondaryVariant,
    required this.surface,
    required this.background,
    required this.error,
    required this.onPrimary,
    required this.onSecondary,
    required this.onSurface,
    required this.onBackground,
    required this.onError,
    required this.brightness,
  }) : super(
          primary: primary,
          primaryVariant: primaryVariant,
          secondary: secondary,
          secondaryVariant: secondaryVariant,
          surface: surface,
          background: background,
          error: error,
          onPrimary: onPrimary,
          onSecondary: onSecondary,
          onSurface: onSurface,
          onBackground: onBackground,
          onError: onError,
          brightness: brightness,
        );
  factory ThemedColorScheme.dark() => ThemedColorScheme._(
        primary: _Black,
        primaryVariant: _BlueDark,
        secondary: _PurpleDark,
        secondaryVariant: _PurpleDark,
        surface: _BlueDark,
        background: _Black,
        error: _Red,
        onPrimary: _White,
        onSecondary: _Gray,
        onSurface: _White,
        onBackground: _White,
        onError: _Black,
        brightness: Brightness.light,
      );
  factory ThemedColorScheme.light() => ThemedColorScheme._(
        primary: _White,
        primaryVariant: _WhiteDark,
        secondary: _BlueDark,
        secondaryVariant: _Blue,
        surface: _WhiteDark,
        background: _White,
        error: _Red,
        onPrimary: _Black,
        onSecondary: _Gray,
        onSurface: _Black,
        onBackground: _Black,
        onError: _Black,
        brightness: Brightness.dark,
      );
}
