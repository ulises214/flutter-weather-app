part of weather_models;

class LocationModel {
  final int _id;
  final String _city;
  late final String? _state;
  final String _country;

  LocationModel(this._id, this._city, this._country, {String? state}) {
    this._state = state;
  }
  get city => _city;
  get longLocation => '$_city,${_state != null ? '$_state,' : ''}$_country';
  get id => _id;
}
