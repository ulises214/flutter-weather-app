part of controllers_library;

class MeasurementController extends GetxController {
  late final Rx<MeasurementUnits> units;
  MeasurementUnits _currentUnit;

  MeasurementController([this._currentUnit = MeasurementUnits.METRIC]) {
    units = _currentUnit.obs;
  }
  change(MeasurementUnits newUnits) {
    if (newUnits == _currentUnit) return;
    _currentUnit = newUnits;
    units.value = _currentUnit;
  }

  alternate() {
    var nextIndex = MeasurementUnits.values.indexOf(_currentUnit) + 1;
    if (nextIndex <= MeasurementUnits.values.length)
      change(MeasurementUnits.values[0]);
    change(MeasurementUnits.values[nextIndex]);
  }
}
