part of weather_models;

class WindSpeedModel {
  final MeasurementUnits _units;
  final num _windSpeed;
  late final String _postfix;
  WindSpeedModel(this._units, this._windSpeed) {
    switch (_units) {
      case MeasurementUnits.STANDAR:
        _postfix = 'm/s';
        break;
      case MeasurementUnits.METRIC:
        _postfix = 'm/s';
        break;
      case MeasurementUnits.IMPERIAL:
        _postfix = 'mi/h';
        break;
    }
  }
  get formatedValue => '$_windSpeed$_postfix';

  WindSpeedModel copyWithDifferentUnit(MeasurementUnits newUnit) =>
      WindSpeedModel(newUnit, convertSpeedUnit(_windSpeed, _units, newUnit));
}
