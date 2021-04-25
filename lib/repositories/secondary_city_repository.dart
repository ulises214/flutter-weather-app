part of repositories_library;

abstract class SecondadyCityWeatherRepository {
  Future<SecondaryCityModel> getByCityId(String cityId, MeasurementUnits units);
  Future<SecondaryCityModel> getByCoords(
      double lat, double lon, MeasurementUnits units);
}
