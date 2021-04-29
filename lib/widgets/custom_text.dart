part of custom_widgets;

class CustomText extends StatelessWidget {
  final String _text;
  final TextStylesTypes _style;
  CustomText._(this._text, this._style);
  @override
  Widget build(BuildContext context) {
    return Text(_text, style: _getStyle(context));
  }

  TextStyle? _getStyle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    switch (_style) {
      case TextStylesTypes.BodyText1:
        return textTheme.bodyText1;
      case TextStylesTypes.BodyText2:
        return textTheme.bodyText2;
      case TextStylesTypes.HeadLine1:
        return textTheme.headline1;
      case TextStylesTypes.HeadLine2:
        return textTheme.headline2;
      case TextStylesTypes.HeadLine3:
        return textTheme.headline3;
      case TextStylesTypes.HeadLine4:
        return textTheme.headline4;
    }
  }

  factory CustomText.title(String text, ThemeController controller) =>
      CustomText._(text, TextStylesTypes.HeadLine3);
  factory CustomText.subtitle(String text, ThemeController controller) =>
      CustomText._(text, TextStylesTypes.HeadLine4);
  factory CustomText.temperatureTitle(
          String text, ThemeController controller) =>
      CustomText._(text, TextStylesTypes.HeadLine1);
  factory CustomText.temperatureSubtitle(
          String text, ThemeController controller) =>
      CustomText._(text, TextStylesTypes.HeadLine2);
  factory CustomText.body(String text, ThemeController controller) =>
      CustomText._(text, TextStylesTypes.BodyText1);
  factory CustomText.bodySecondary(String text, ThemeController controller) =>
      CustomText._(text, TextStylesTypes.BodyText2);
}
