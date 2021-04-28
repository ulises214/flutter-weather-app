part of weather_models;

class HumidityModel {
  final num _humidityRate;
  HumidityModel(this._humidityRate);
  get formatted => '$_humidityRate%';
}
