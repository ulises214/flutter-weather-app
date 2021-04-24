part of weather_models;

class HumidityModel {
  final int _humidityRate;
  HumidityModel(this._humidityRate);
  get humidity => '$_humidityRate%';
}
