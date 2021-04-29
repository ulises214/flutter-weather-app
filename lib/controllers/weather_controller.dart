part of controllers_library;

class WeatherController extends GetxController {
  late final Rx<MainCityModel?> _mainCity = Rx(null);
  final RxList<MapEntry<num, SecondaryCityModel>> _secondaryCities = RxList();
  late final Rx<MeasurementUnits> _units;

  final MainCityWeatherRepository _mainCityRepository =
      OpenWeatherMainCityWeatherRepository();
  final SecondadyCityWeatherRepository _secondaryCityRepository =
      OpenWeatherSecondadyCityWeatherRepository();

  WeatherController([units = MeasurementUnits.METRIC]) {
    this._units = Rx<MeasurementUnits>(units);
    _appendSecondaryCity(1850147);
    _appendSecondaryCity(5128638);
    _appendSecondaryCity(4000524);
    _appendSecondaryCity(3981362);
  }
  // ? Getters
  MainCityModel? get mainCity {
    if (_mainCity.value == null) _updateMainCity();
    return _mainCity.value;
  }

  List<SecondaryCityModel> get secondaryCities =>
      _secondaryCities.map<SecondaryCityModel>((c) => c.value).toList();
  MeasurementUnits get units => _units.value;

  // ? Update state
  _updateMainCity() async {
    _mainCity.value = (await _mainCityRepository.getByCoords(19, -103, units));
  }

  reOrderSecondaryList(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex = newIndex - 1;
    }
    final element = _secondaryCities.removeAt(oldIndex);
    _secondaryCities.insert(newIndex, element);
  }

  appendSecondaryCity(SearchableCity cityToSearch) async {
    final id = cityToSearch.location.id;
    if (_secondaryCities.any((e) => e.key == id)) return;
    _appendSecondaryCity(id);
  }

  _appendSecondaryCity(num id) async {
    try {
      var city = await _secondaryCityRepository.getByCityId(id, units);
      _secondaryCities.add(MapEntry(id, city));
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
    _secondaryCities.assignAll(
      _secondaryCities
          .map((c) => MapEntry(c.key, c.value.copyWithDifferentUnit(units)))
          .toList(),
    );
    update();
  }

  void _change(MeasurementUnits newUnits) {
    _units.value = newUnits;
    _updateUnits();
  }
}
