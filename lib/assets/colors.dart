part of assets;

const _Pink = Color(0xFFFF54A6);
// const _PinkLigth = Color(0xFFfbbaa1);
const _Black = Color(0xFF081B25);
const _White = Color(0xFFfefbf2);
const _WhiteDark = Color(0xFFF1EFEC);
const _Red = Color(0xFFef5352);
// const _Orange = Color(0xFFFFB97D);
// const _OrangeDark = Color(0xFFFF983d);
const _Purple = Color(0xFF7b09a3);
const _PurpleDark = Color(0xFF570674);
const _Blue = Color(0xFF2B48D3);
const _BlueDark = Color(0xFF152C39);
const _BlueLight = Color(0xFF27AFFD);
const _Gray = Color(0xFFa0a5b2);
// const _GrayDark = Color(0xFF606676);
const _WhiteShadow = Color.fromRGBO(255, 255, 255, 0);
const _DarkShadow = Color.fromRGBO(0x08, 0x1B, 0x25, 0.9);

class AppColors {
  final Color background;
  final Color card;
  final Color icon;
  final Color shadow;
  final Color border;
  final Color accent;
  final Color text;
  final Color textSecondary;
  final Color extra;
  AppColors._({
    required this.background,
    required this.card,
    required this.icon,
    required this.shadow,
    required this.border,
    required this.accent,
    required this.text,
    required this.textSecondary,
    required this.extra,
  });
  factory AppColors.dark() {
    return AppColors._(
      background: _Black,
      card: _BlueDark,
      icon: _Blue,
      shadow: _WhiteShadow,
      border: _BlueDark,
      accent: _Pink,
      text: _White,
      extra: _Purple,
      textSecondary: _Gray,
    );
  }
  factory AppColors.light() {
    return AppColors._(
      background: _White,
      card: _WhiteDark,
      icon: _BlueDark,
      shadow: _DarkShadow,
      border: _WhiteDark,
      accent: _Red,
      text: _Black,
      extra: _BlueLight,
      textSecondary: _Gray,
    );
  }
}
