part of repositories_library;

abstract class MainCityWeatherRepository {
  Future<MainCityModel> getByCoords(
      double lat, double lon, MeasurementUnits units);
}
