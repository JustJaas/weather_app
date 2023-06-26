import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/blocs/weather/weather_bloc.dart';
import 'package:weather_app/ui/pages/map/loading_page.dart';
import 'package:weather_app/data/helpers/first_capital_helper.dart';

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
    DateTime now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            onPressed: () {
              weatherBloc.add(const ShowExtraData());
            },
            child: const Text(
              key: Key("pronostico_extendido"),
              'Pronóstico\nextendido',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
        title: const Text("Clima"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return state.weatherResponse.weather!.isEmpty
                ? const SizedBox()
                : Column(
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${Country.tryParse(state.weatherResponse.sys!.country!)?.name} - ${state.weatherResponse.name}",
                              style: const TextStyle(fontSize: 24),
                            ),
                            Text(
                              datesToString(now),
                              style: const TextStyle(fontSize: 18),
                            ),
                            Image.network(
                              "https://openweathermap.org/img/wn/${state.weatherResponse.weather![0].icon}@4x.png",
                              height: 150,
                              width: 150,
                            ),
                            Text(
                              '${state.weatherResponse.main!.temp}°C',
                              style: const TextStyle(fontSize: 48),
                            ),
                            Text(
                              capitalizeFirstLetter(state
                                  .weatherResponse.weather![0].description!),
                              style: const TextStyle(fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      state.showExtraData
                          ? Expanded(
                              child: ListView.builder(
                                itemCount:
                                    state.weatherDaysResponse.list!.length,
                                itemBuilder: (context, index) {
                                  final weatherDaysData =
                                      state.weatherDaysResponse.list![index];
                                  DateTime date =
                                      DateTime.fromMillisecondsSinceEpoch(
                                          weatherDaysData.dt! * 1000);
                                  return ListTile(
                                    leading: Image.network(
                                      "https://openweathermap.org/img/w/${weatherDaysData.weather![0].icon}.png",
                                      width: 40,
                                      height: 40,
                                    ),
                                    title: Text(datesToString(date)),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Máx: ${weatherDaysData.main!.tempMax}°C'),
                                        Text(
                                            'Min: ${weatherDaysData.main!.tempMin}°C'),
                                        Text(
                                          key: const Key("descripcion"),
                                          capitalizeFirstLetter(weatherDaysData
                                              .weather![0].description!),
                                        ),
                                        Text(state
                                            .weatherDaysResponse.city!.name!),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          : const SizedBox(),
                    ],
                  );
          },
        ),
      ),
      floatingActionButton: CircleAvatar(
        backgroundColor: const Color.fromRGBO(103, 58, 183, 1),
        maxRadius: 25,
        child: IconButton(
          icon: const Icon(
            Icons.my_location_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoadingPage()),
            );
          },
        ),
      ),
    );
  }
}
