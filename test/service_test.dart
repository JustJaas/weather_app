import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/data/services/weather_service.dart';

void main() {
  group('Weather Service', () {
    test("Get Weather data", () async {
      const lat = "-12.0488";
      const lng = "-77.0495";
      bool success = false;
      final result = await WeatherService().getData(lat, lng);
      if (result != null) {
        success = true;
      }
      expect(success, true);
    });

    test("Get Weather Forecast data", () async {
      const lat = "-12.0488";
      const lng = "-77.0495";
      bool success = false;
      final result = await WeatherService().getDaysData(lat, lng);
      if (result != null) {
        success = true;
      }
      expect(success, true);
    });
  });
}
