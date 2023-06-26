part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final WeatherResponse weatherResponse;
  final WeatherDaysResponse weatherDaysResponse;
  final String lat;
  final String lng;
  final String tempLat;
  final String tempLng;
  final bool showExtraData;

  const WeatherState(
      {required this.weatherResponse,
      required this.weatherDaysResponse,
      required this.lat,
      required this.lng,
      required this.tempLat,
      required this.tempLng,
      required this.showExtraData});

  WeatherState copyWith(
      {WeatherResponse? weatherResponse,
      WeatherDaysResponse? weatherDaysResponse,
      String? lat,
      String? lng,
      String? tempLat,
      String? tempLng,
      bool? showExtraData}) {
    return WeatherState(
        weatherResponse: weatherResponse ?? this.weatherResponse,
        weatherDaysResponse: weatherDaysResponse ?? this.weatherDaysResponse,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        tempLat: tempLat ?? this.tempLat,
        tempLng: tempLng ?? this.tempLng,
        showExtraData: showExtraData ?? this.showExtraData);
  }

  @override
  List<Object> get props => [
        weatherResponse,
        weatherDaysResponse,
        lat,
        lng,
        tempLat,
        tempLng,
        showExtraData
      ];
}
