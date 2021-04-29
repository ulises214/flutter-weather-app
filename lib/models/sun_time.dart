part of weather_models;

class SunTime {
  final int _timestamp;
  final int _timeZone;
  late final DateTime _date;
  SunTime(this._timestamp, this._timeZone) {
    _date = DateTime.fromMillisecondsSinceEpoch(
      (_timestamp + _timeZone) * 1000,
      isUtc: true,
    );
  }
  get formatted {
    var formatter = DateFormat.jm();
    return formatter.format(_date);
  }
}
