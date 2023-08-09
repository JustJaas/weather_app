import 'package:flutter/material.dart';
import 'package:weather_app/data/helpers/first_capital_helper.dart';
import 'package:country_picker/country_picker.dart';
import 'package:weather_app/domain/models/weather_response_model.dart';

class MainInfo extends StatelessWidget {
  final WeatherResponse weatherResponse;
  const MainInfo({
    Key? key,
    required this.weatherResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${Country.tryParse(weatherResponse.sys!.country!)?.name} - ${weatherResponse.name}",
            style: const TextStyle(
              fontSize: 24,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            datesFullToString(now),
            style: const TextStyle(
              fontSize: 18,
              color: Colors.deepPurple,
            ),
          ),
          Image.network(
            "https://openweathermap.org/img/wn/${weatherResponse.weather![0].icon}@4x.png",
            height: 150,
            width: 150,
          ),
          Text(
            '${weatherResponse.main!.temp}°C',
            style: const TextStyle(
              fontSize: 50,
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            capitalizeFirstLetter(weatherResponse.weather![0].description!),
            style: const TextStyle(
              fontSize: 24,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}
