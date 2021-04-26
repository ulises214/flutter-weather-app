part of controllers_library;

class WeatherController extends GetxController {
  late final Rx<MainCityModel?> mainCity = Rx(null);
  late final MainCityWeatherRepository _mainCityRepository;
  late MeasurementUnits _units;
  WeatherController() {
    _mainCityRepository = OpenWeatherMainCityWeatherRepository();
  }
  updateUnits(MeasurementUnits units) {
    _units = units;
    mainCity.value = mainCity.value?.copyWithDifferentUnit(_units);
  }

  updateMainCity() async {
    mainCity.value = (await _mainCityRepository.getByCoords(19, -103, _units));
  }
}
