part of openweather_repositories_library;

const _BASE_API_URI = 'api.openweathermap.org';
const _API_KEY = 'b22686f0e05ead7db6952d8d3f0a39ba';

const _FIND_API_KEY = '439d4b804bc8187953eb36d2a8c26a02';
const _FIND_URI = 'openweathermap.org';

// mi casa 19,-103
//

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

Uri _getSecondaryCityUriById(num cityId, MeasurementUnits units) => Uri.https(
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
Uri _getSearchCityUriByQuery(String query, int count) => Uri.https(
      _FIND_URI,
      'data/2.5/find',
      {
        'q': query,
        'type': 'like',
        'sort': 'population',
        'cnt': '$count',
        'appid': _FIND_API_KEY
      },
    );
