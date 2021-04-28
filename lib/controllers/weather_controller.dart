part of controllers_library;

class WeatherController extends GetxController {
  late final Rx<MainCityModel?> _mainCity = Rx(null);
  final RxMap<num, SecondaryCityModel> _secondaryCities = RxMap();
  late final Rx<MeasurementUnits> _units;

  final MainCityWeatherRepository _mainCityRepository =
      OpenWeatherMainCityWeatherRepository();
  final SecondadyCityWeatherRepository _secondaryCityRepository =
      OpenWeatherSecondadyCityWeatherRepository();

  WeatherController([units = MeasurementUnits.METRIC]) {
    this._units = Rx<MeasurementUnits>(units);
  }
  // ? Getters
  MainCityModel? get mainCity {
    if (_mainCity.value == null) _updateMainCity();
    return _mainCity.value;
  }

  List<SecondaryCityModel> get secondaryCities =>
      _secondaryCities.values.map<SecondaryCityModel>((c) => c).toList();
  MeasurementUnits get units => _units.value;

  // ? Update state
  _updateMainCity() async {
    _mainCity.value = (await _mainCityRepository.getByCoords(19, -103, units));
  }

  appendSecondaryCity(SearchableCity cityToSearch) async {
    if (_secondaryCities[cityToSearch.location.id] != null) return;
    final id = cityToSearch.location.id;
    try {
      var city = await _secondaryCityRepository.getByCityId(id, units);
      _secondaryCities[id] = city;
    } catch (e) {
      print('Veeeerde e');
    }
  }

  // ? Update units
  void alternateUnits() {
    var nextIndex = MeasurementUnits.values.indexOf(units) + 1;
    if (nextIndex < MeasurementUnits.values.length)
      _change(MeasurementUnits.values[nextIndex]);
    else
      _change(MeasurementUnits.values[0]);
  }

  _updateUnits() {
    _mainCity.value = _mainCity.value?.copyWithDifferentUnit(units);
    _secondaryCities.entries.forEach((c) {
      _secondaryCities[c.key] = c.value.copyWithDifferentUnit(units);
    });
  }

  void _change(MeasurementUnits newUnits) {
    _units.value = newUnits;
    _updateUnits();
  }
}
