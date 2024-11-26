import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/blocs/weather/weather_bloc.dart';
import 'package:weather_app/ui/pages/home/additional_info.dart';
import 'package:weather_app/ui/pages/home/extended_forecast.dart';
import 'package:weather_app/ui/pages/home/main_info.dart';
import 'package:weather_app/ui/pages/map/map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WeatherBloc weatherBloc;

  @override
  void initState() {
    super.initState();
    weatherBloc = BlocProvider.of<WeatherBloc>(context);
    final initLat = weatherBloc.state.lat;
    final initLng = weatherBloc.state.lng;
    weatherBloc.add(GetWeather(lat: initLat, lng: initLng));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            key: const Key("pronostico_extendido"),
            onPressed: () {
              weatherBloc.add(const ShowExtraData());
            },
            child: const Icon(
              Icons.add_chart_outlined,
              color: Colors.white,
            ),
          ),
        ],
        title: const Text(
          "Pronóstico Meteorológico",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return state.weatherResponse.weather!.isEmpty
                ? const SizedBox()
                : FadeInDown(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            throw Exception('This is test exception');
                          },
                          child: const Text('Verify Sentry Setup'),
                        ),
                        const SizedBox(height: 15),
                        MainInfo(weatherResponse: state.weatherResponse),
                        const SizedBox(height: 5),
                        AdditionalInfo(
                          feelsLike:
                              state.weatherResponse.main!.feelsLike.toString(),
                          humidity:
                              state.weatherResponse.main!.humidity.toString(),
                          pressure:
                              state.weatherResponse.main!.pressure.toString(),
                        ),
                        const SizedBox(height: 15),
                        state.showExtraData
                            ? FadeInUp(
                                child: ExtendedForecast(
                                  weatherForecast: state.weatherDaysResponse,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: CircleAvatar(
        backgroundColor: const Color.fromRGBO(103, 58, 183, 1),
        maxRadius: 25,
        child: IconButton(
          key: const Key('gps_button'),
          icon: const Icon(
            Icons.my_location_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MapPage()),
            );
          },
        ),
      ),
    );
  }
}
