import 'package:dio/dio.dart';
import 'package:weather_app/data/services/weather_interceptor.dart';
import 'package:weather_app/domain/models/weather_days_response_model.dart';
import 'package:weather_app/domain/models/weather_response_model.dart';

class WeatherService {
  final Dio dioWeather;
  final String urlWeather = "https://api.openweathermap.org/data/2.5";

  WeatherService() : dioWeather = Dio()..interceptors.add(WeatherInterceptor());

  Future<WeatherResponse> getData(String lat, String lng) async {
    final url = '$urlWeather/weather?lat=$lat&lon=$lng';
    final response = await dioWeather.get(url);

    if (response.statusCode == 200) {
      final WeatherResponse weatherResponse =
          WeatherResponse.fromJson((response.data));
      return weatherResponse;
    } else {
      throw Exception('Error al cargar los datos meteorológicos');
    }
  }

  Future<WeatherDaysResponse> getDaysData(String lat, String lng) async {
    final url = '$urlWeather/forecast?lat=$lat&lon=$lng';
    final response = await dioWeather.get(url);

    if (response.statusCode == 200) {
      final WeatherDaysResponse weatherDaysResponse =
          WeatherDaysResponse.fromJson((response.data));
      return weatherDaysResponse;
    } else {
      throw Exception('Error al cargar los datos meteorológicos');
    }
  }
}
