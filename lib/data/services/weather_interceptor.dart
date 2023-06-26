import 'package:dio/dio.dart';

class WeatherInterceptor extends Interceptor {
  final apiKey = "270422a23c8e0841bdffd845585414d0";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'appid': apiKey,
      'units': 'metric',
      'lang': 'es',
    });
    super.onRequest(options, handler);
  }
}
