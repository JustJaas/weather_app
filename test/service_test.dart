import 'package:flutter/material.dart';
import 'package:flutter_driver/flutter_driver.dart';
// import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/data/services/weather_service.dart';
import 'package:weather_app/domain/models/weather_days_response_model.dart';

// import 'package:flutter_driver/flutter_driver.dart';
// Mock del objeto Dio
class MockDio extends Mock implements Dio {}

void main() {
  group('Weather Service', () {
    Dio dio = Dio();
    final weatherService = WeatherService();
    const urlWeather = 'https://api.openweathermap.org/data/2.5';

    final extendedButton = find.byValueKey("pronostico_extendido");
    final resultText = find.byValueKey("descripcion");

    late final FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      driver.close();
    });

    test('Probar boton', () async {
      await driver.tap(extendedButton);
      final titleText = await driver.getText(resultText);
      expect(titleText, isNotNull);
    });

    // test('getDaysData should return WeatherDaysResponse', () async {
    //   final api = WeatherService();
    // });

    // test('getDaysData Test', () async {
    //   const lat = '-12.0488';
    //   const lng = '-77.0495';

    //   final expectedResponse = WeatherDaysResponse();

    //   final response = await dio.get('$urlWeather/forecast?lat=$lat&lon=$lng');

    //   if (response.statusCode == 200) {
    //     final weatherDaysResponse = WeatherDaysResponse.fromJson(response.data);
    //     expect(weatherDaysResponse, expectedResponse);
    //   } else {
    //     fail('Error al cargar los datos meteorológicos');
    //   }
    // });

    // test('probando', () async {});
  });
}
