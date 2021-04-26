part of helpers_library;

num convertTempUnit(num temp, MeasurementUnits from, MeasurementUnits to) {
  if (from == to) return temp;
  switch (from) {
    case MeasurementUnits.STANDAR:
      if (to == MeasurementUnits.IMPERIAL)
        return (temp - 273.15) * 1.8000 + 32.00;
      return temp - 273.15;
    case MeasurementUnits.METRIC:
      if (to == MeasurementUnits.IMPERIAL) return temp * 1.8000 + 32.00;
      return temp + 273.15;
    case MeasurementUnits.IMPERIAL:
      if (to == MeasurementUnits.METRIC) return (temp - 32) / 1.8000;
      return (temp - 32) / 1.8000 + 273.15;
  }
}
