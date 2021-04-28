part of helpers_library;

num convertSpeedUnit(num speed, MeasurementUnits from, MeasurementUnits to) {
  if (from == to) return speed;
  switch (from) {
    // case MeasurementUnits.STANDAR:
    //   if (to == MeasurementUnits.IMPERIAL) return speed * 2.237;
    //   break;
    case MeasurementUnits.METRIC:
      if (to == MeasurementUnits.IMPERIAL) return speed * 2.237;
      break;
    case MeasurementUnits.IMPERIAL:
      return speed / 2.237;
  }
  // STANDAR & METRIC are equals
  return speed;
}
