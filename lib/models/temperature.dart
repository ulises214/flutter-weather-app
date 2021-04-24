part of weather_models;

class TemperatureModel {
  final MeasurementUnits _units;
  final int _tempMin;
  final int _tempMax;
  late final String _postfix;
  TemperatureModel(this._units, this._tempMin, this._tempMax) {
    switch (_units) {
      case MeasurementUnits.STANDAR:
        _postfix = 'K';
        break;
      case MeasurementUnits.METRIC:
        _postfix = '°C';
        break;
      case MeasurementUnits.IMPERIAL:
        _postfix = '°F';
        break;
    }
  }
  get max => '$_tempMax$_postfix';
  get min => '$_tempMin$_postfix';
  TemperatureModel copyWithDifferentUnit(MeasurementUnits newUnit) =>
      TemperatureModel(newUnit, _tempMin, _tempMax);
}
