part of weather_models;

class SunTime {
  final int _timestamp;
  late final DateTime _date;
  SunTime(this._timestamp) {
    _date = DateTime.fromMillisecondsSinceEpoch(
      _timestamp * 1000,
    );
  }
  get formated {
    var formatter = DateFormat.jm();
    return formatter.format(_date);
  }
}
