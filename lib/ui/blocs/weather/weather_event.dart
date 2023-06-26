part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeather extends WeatherEvent {
  final String lat;
  final String lng;
  const GetWeather({required this.lat, required this.lng});
}

class SetCoords extends WeatherEvent {
  final String tempLat;
  final String tempLng;
  const SetCoords({required this.tempLat, required this.tempLng});
}

class SetExtraData extends WeatherEvent {
  final WeatherDaysResponse weatherDaysResponse;
  const SetExtraData({required this.weatherDaysResponse});
}

class ShowExtraData extends WeatherEvent {
  const ShowExtraData();
}

class GetDaysWeather extends WeatherEvent {}
