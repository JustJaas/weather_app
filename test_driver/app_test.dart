// import 'package:flutter/material.dart';
import 'package:flutter_driver/flutter_driver.dart';
// import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:dio/dio.dart';
// import 'package:weather_app/data/services/weather_service.dart';
// import 'package:weather_app/domain/models/weather_days_response_model.dart';
import 'dart:developer' as developer;

void main() {
  group('Weather Service', () {
    const urlWeather = 'https://api.openweathermap.org/data/2.5';

    final extendedButton = find.byValueKey("pronostico_extendido");
    final resultText = find.byValueKey("descripcion");

    late final FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // tearDownAll(() {
    // driver.close();
    // });

    test('Obtener pronóstico extendido', () async {
      developer.log("titleText.runtimeType");

      await driver.tap(extendedButton);
      final titleText = await driver.getText(resultText);
      developer.log(titleText.runtimeType.toString());

      expect(titleText, isNotEmpty);
    });
  });
}
