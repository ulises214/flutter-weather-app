part of weather_models;

class PressureModel {
  final int _pressure;
  final String _postfix = 'hPa';
  PressureModel(this._pressure);

  get pressure => '$_pressure$_postfix';
}
