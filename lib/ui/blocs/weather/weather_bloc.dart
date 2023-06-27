import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/services/weather_service.dart';
import 'package:weather_app/domain/models/weather_days_response_model.dart';
import 'package:weather_app/domain/models/weather_response_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc()
      : super(WeatherState(
          weatherResponse: WeatherResponse.fromJson({}),
          weatherDaysResponse: WeatherDaysResponse.fromJson({}),
          lat: "-12.0488",
          lng: "-77.0495",
          tempLat: "-12.0488",
          tempLng: "-77.0495",
          showExtraData: false,
        )) {
    on<GetWeather>((event, emit) async {
      final weatherData = await WeatherService().getData(event.lat, event.lng);
      getExtraData();
      emit(state.copyWith(
          weatherResponse: weatherData, lat: event.lat, lng: event.lng));
    });

    on<GetDaysWeather>((event, emit) async {
      add(GetWeather(lat: state.tempLat, lng: state.tempLng));
      emit(state.copyWith(lat: state.tempLat, lng: state.tempLng));
    });

    on<SetCoords>((event, emit) {
      emit(state.copyWith(tempLat: event.tempLat, tempLng: event.tempLng));
    });

    on<ShowExtraData>((event, emit) =>
        emit(state.copyWith(showExtraData: !state.showExtraData)));

    on<SetExtraData>((event, emit) =>
        emit(state.copyWith(weatherDaysResponse: event.weatherDaysResponse)));
  }
  getExtraData() async {
    final weatherDaysData =
        await WeatherService().getDaysData(state.lat, state.lng);
    add(SetExtraData(weatherDaysResponse: weatherDaysData));
  }
}
