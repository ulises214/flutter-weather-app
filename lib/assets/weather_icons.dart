part of assets;

const _AvalibleIcons = [
  'cloudy',
  'rainy3',
  'rainy4',
  'rainy5',
  'rainy6',
  'snowy3',
  'snowy4',
  'thunder',
  'cloudyDay',
  'cloudyNight',
  'day',
  'night',
  'rainy1',
  'rainy2',
  'snowy1',
  'snowy2',
];

class _Sizes {
  _Sizes(String path, String assetName) {
    this.x24 = path + '24/' + assetName;
    this.x48 = path + '48/' + assetName;
    this.x128 = path + '128/' + assetName;
    this.x1024 = path + '1024/' + assetName;
  }
  late final String x24;
  late final String x48;
  late final String x128;
  late final String x1024;
}

abstract class _Dark {
  static const _Path = 'assets/weather_icons/dark/';
  static final cloudyDay = _Sizes(_Path, 'cloudy-day-1.png');
  static final cloudyNight = _Sizes(_Path, 'cloudy-night.png');
  static final day = _Sizes(_Path, 'day.png');
  static final night = _Sizes(_Path, 'night.png');
  static final rainy1 = _Sizes(_Path, 'rainy-1.png');
  static final rainy2 = _Sizes(_Path, 'rainy-2.png');
  static final snowy1 = _Sizes(_Path, 'snowy-1.png');
  static final snowy2 = _Sizes(_Path, 'snowy-2.png');
}

abstract class _Light {
  static const _Path = 'assets/weather_icons/light/';
  static final cloudyDay = _Sizes(_Path, 'cloudy-day-1.png');
  static final cloudyNight = _Sizes(_Path, 'cloudy-night.png');
  static final day = _Sizes(_Path, 'day.png');
  static final night = _Sizes(_Path, 'night.png');
  static final rainy1 = _Sizes(_Path, 'rainy-1.png');
  static final rainy2 = _Sizes(_Path, 'rainy-2.png');
  static final snowy1 = _Sizes(_Path, 'snowy-1.png');
  static final snowy2 = _Sizes(_Path, 'snowy-2.png');
}

class ThemedIcons {
  static const _Path = 'assets/weather_icons/common/';
  // Common
  final cloudy = _Sizes(_Path, 'cloudy.png');
  final rainy3 = _Sizes(_Path, 'rainy-3.png');
  final rainy4 = _Sizes(_Path, 'rainy-4.png');
  final rainy5 = _Sizes(_Path, 'rainy-5.png');
  final rainy6 = _Sizes(_Path, 'rainy-6.png');
  final snowy3 = _Sizes(_Path, 'snowy-3.png');
  final snowy4 = _Sizes(_Path, 'snowy-4.png');
  final thunder = _Sizes(_Path, 'thunder.png');
  final _Sizes cloudyDay;
  final _Sizes cloudyNight;
  final _Sizes day;
  final _Sizes night;
  final _Sizes rainy1;
  final _Sizes rainy2;
  final _Sizes snowy1;
  final _Sizes snowy2;
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
  _Sizes find(String iconName) {
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
