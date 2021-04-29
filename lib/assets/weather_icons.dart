part of assets;

// class _Sizes {
//   _Sizes(String path, String assetName) {
//     this.x24 = path + '24/' + assetName;
//     this.x48 = path + '48/' + assetName;
//     this.x128 = path + '128/' + assetName;
//     this.x1024 = path + '1024/' + assetName;
//   }
//   late final String x24;
//   late final String x48;
//   late final String x128;
//   late final String x1024;
// }

abstract class _Dark {
  static const _Path = 'assets/weather_icons/dark/1024/';
  static final cloudyDay = _Path + 'cloudy-day-1.png';
  static final cloudyNight = _Path + 'cloudy-night.png';
  static final day = _Path + 'day.png';
  static final night = _Path + 'night.png';
  static final rainy1 = _Path + 'rainy-1.png';
  static final rainy2 = _Path + 'rainy-2.png';
  static final snowy1 = _Path + 'snowy-1.png';
  static final snowy2 = _Path + 'snowy-2.png';
}

abstract class _Light {
  static const _Path = 'assets/weather_icons/light/1024/';
  static final cloudyDay = _Path + 'cloudy-day-1.png';
  static final cloudyNight = _Path + 'cloudy-night.png';
  static final day = _Path + 'day.png';
  static final night = _Path + 'night.png';
  static final rainy1 = _Path + 'rainy-1.png';
  static final rainy2 = _Path + 'rainy-2.png';
  static final snowy1 = _Path + 'snowy-1.png';
  static final snowy2 = _Path + 'snowy-2.png';
}

class ThemedIcons {
  static const _Path = 'assets/weather_icons/common/1024/';
  // Common
  final cloudy = _Path + 'cloudy.png';
  final rainy3 = _Path + 'rainy-3.png';
  final rainy4 = _Path + 'rainy-4.png';
  final rainy5 = _Path + 'rainy-5.png';
  final rainy6 = _Path + 'rainy-6.png';
  final snowy3 = _Path + 'snowy-3.png';
  final snowy4 = _Path + 'snowy-4.png';
  final thunder = _Path + 'thunder.png';
  final noWeather = _Path + 'no-weather.png';
  final String cloudyDay;
  final String cloudyNight;
  final String day;
  final String night;
  final String rainy1;
  final String rainy2;
  final String snowy1;
  final String snowy2;
  ThemedIcons({
    required this.cloudyDay,
    required this.cloudyNight,
    required this.day,
    required this.night,
    required this.rainy1,
    required this.rainy2,
    required this.snowy1,
    required this.snowy2,
  });
  factory ThemedIcons.dark() {
    return ThemedIcons(
        cloudyDay: _Dark.cloudyDay,
        cloudyNight: _Dark.cloudyNight,
        day: _Dark.day,
        night: _Dark.night,
        rainy1: _Dark.rainy1,
        rainy2: _Dark.rainy2,
        snowy1: _Dark.snowy1,
        snowy2: _Dark.snowy2);
  }
  factory ThemedIcons.light() {
    return ThemedIcons(
        cloudyDay: _Light.cloudyDay,
        cloudyNight: _Light.cloudyNight,
        day: _Light.day,
        night: _Light.night,
        rainy1: _Light.rainy1,
        rainy2: _Light.rainy2,
        snowy1: _Light.snowy1,
        snowy2: _Light.snowy2);
  }
  String find(String iconName) {
    if ('cloudy' == iconName)
      return cloudy;
    else if ('rainy3' == iconName)
      return rainy3;
    else if ('rainy4' == iconName)
      return rainy4;
    else if ('rainy5' == iconName)
      return rainy5;
    else if ('rainy6' == iconName)
      return rainy6;
    else if ('snowy3' == iconName)
      return snowy3;
    else if ('snowy4' == iconName)
      return snowy4;
    else if ('thunder' == iconName)
      return thunder;
    else if ('cloudyDay' == iconName)
      return cloudyDay;
    else if ('cloudyNight' == iconName)
      return cloudyNight;
    else if ('day' == iconName)
      return day;
    else if ('night' == iconName)
      return night;
    else if ('rainy1' == iconName)
      return rainy1;
    else if ('rainy2' == iconName)
      return rainy2;
    else if ('snowy1' == iconName)
      return snowy1;
    else if ('snowy2' == iconName)
      return snowy2;
    else
      throw new ErrorDescription('Este icono no existe');
  }
}
