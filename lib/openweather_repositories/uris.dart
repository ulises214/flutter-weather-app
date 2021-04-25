part of openweather_repositories_library;

const _API_KEY = 'b22686f0e05ead7db6952d8d3f0a39ba';
const _BASE_API_URI = 'api.openweathermap.org';
// mi casa 19,-103
//
String _measurementUnitToString(MeasurementUnits units) =>
    // MeasurementUnits.STANDAR => standar
    units.toString().split('.')[1].toLowerCase();

Uri _getMainCityUriByCoords(double lat, double lon, MeasurementUnits units) =>
    Uri.https(
      _BASE_API_URI,
      'data/2.5/onecall',
      {
        'lat': '$lat',
        'lon': '$lon',
        'exclude': 'minutely,alerts',
        'units': _measurementUnitToString(units),
        'appid': _API_KEY
      },
    );

Uri _getSecondaryCityUriById(String cityId, MeasurementUnits units) =>
    Uri.https(
      _BASE_API_URI,
      'data/2.5/weather',
      {
        'id': '$cityId',
        'units': _measurementUnitToString(units),
        'appid': _API_KEY
      },
    );

Uri _getSecondaryCityUriByCoords(
        double lat, double lon, MeasurementUnits units) =>
    Uri.https(
      _BASE_API_URI,
      'data/2.5/weather',
      {
        'lat': '$lat',
        'lon': '$lon',
        'units': _measurementUnitToString(units),
        'appid': _API_KEY
      },
    );
