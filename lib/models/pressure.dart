part of weather_models;

class PressureModel {
  final num _pressure;
  final String _postfix = 'hPa';
  PressureModel(this._pressure);

  get formate => '$_pressure$_postfix';
}
