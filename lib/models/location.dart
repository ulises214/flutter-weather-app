part of weather_models;

class LocationModel {
  final num _id;
  final String _city;
  late final String? _state;
  final String _country;

  LocationModel(this._id, this._city, this._country, {String? state}) {
    this._state = state;
  }
  String get city => _city;
  String get country => _country;
  String get longLocation =>
      '$_city, ${_state != null ? '$_state, ' : ''}$_country';
  num get id => _id;
}
