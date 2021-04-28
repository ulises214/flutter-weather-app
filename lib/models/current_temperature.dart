part of weather_models;

class CurrentTemperatureModel {
  final MeasurementUnits _units;
  final num _temp;
  late final String _postfix;
  CurrentTemperatureModel(this._units, this._temp) {
    switch (_units) {
      // case MeasurementUnits.STANDAR:
      //   _postfix = 'K';
      //   break;
      case MeasurementUnits.METRIC:
        _postfix = '°';
        break;
      case MeasurementUnits.IMPERIAL:
        _postfix = 'F';
        break;
    }
  }
  String _removeDecimals() {
    if (_temp.toStringAsFixed(1).endsWith('0')) return _temp.toStringAsFixed(0);
    return _temp.toStringAsFixed(1);
  }

  get formatted => '${_temp.toStringAsFixed(1)}$_postfix';
  get pretty => '${_removeDecimals()}$_postfix';

  CurrentTemperatureModel copyWithDifferentUnit(MeasurementUnits newUnit) {
    return CurrentTemperatureModel(
        newUnit, convertTempUnit(_temp, _units, newUnit));
  }
}
