part of weather_models;

class CurrentTemperatureModel {
  final MeasurementUnits _units;
  final double _temp;
  late final String _postfix;
  CurrentTemperatureModel(this._units, this._temp) {
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
  get temp => '$_temp$_postfix';
  CurrentTemperatureModel copyWithDifferentUnit(MeasurementUnits newUnit) =>
      CurrentTemperatureModel(newUnit, _temp);
}
