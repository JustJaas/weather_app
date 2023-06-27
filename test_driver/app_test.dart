import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Weather Service', () {
    late final FlutterDriver driver;

    final extendedButton = find.byValueKey("pronostico_extendido");
    final containerInfo = find.byValueKey("container");
    final confirmButton = find.byValueKey('confirm_button');
    final gpsButton = find.byValueKey('gps_button');

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Get weather info', () async {
      await driver.tap(extendedButton);
      final result = await driver.getWidgetDiagnostics(containerInfo);
      expect(result, isNotEmpty);
    });

    test('Access to map', () async {
      await driver.tap(gpsButton);
      await Future.delayed(const Duration(seconds: 2));

      await driver.scroll(
        find.byType('GoogleMap'),
        0,
        -100,
        const Duration(milliseconds: 500),
      );
      await driver.tap(confirmButton);
      final result = await driver.getWidgetDiagnostics(containerInfo);
      expect(result, isNotEmpty);
    });
  });
}
