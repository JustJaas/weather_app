import 'package:flutter/material.dart';
import 'package:weather_app/data/helpers/first_capital_helper.dart';
import 'package:weather_app/domain/models/weather_days_response_model.dart';

class ExtendedForecast extends StatelessWidget {
  final WeatherDaysResponse weatherForecast;
  const ExtendedForecast({
    Key? key,
    required this.weatherForecast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key("container"),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 180,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: weatherForecast.list!.length,
        itemBuilder: (context, index) {
          final weatherDaysData = weatherForecast.list![index];
          DateTime date =
              DateTime.fromMillisecondsSinceEpoch(weatherDaysData.dt! * 1000);
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.deepPurple[50],
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: 120,
            child: Column(
              children: [
                Center(
                  child: Text(
                    datesToString(date),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.deepPurple[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Image.network(
                  "https://openweathermap.org/img/w/${weatherDaysData.weather![0].icon}.png",
                  width: 45,
                  height: 45,
                ),
                Text(
                  '${weatherDaysData.main!.temp}°C',
                  style: TextStyle(
                    color: Colors.deepPurple[600],
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  capitalizeFirstLetter(
                      weatherDaysData.weather![0].description!),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurple[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Max:",
                      style: TextStyle(color: Colors.deepPurple[600]),
                    ),
                    Text(
                      "${weatherDaysData.main!.tempMax}°C",
                      style: TextStyle(color: Colors.deepPurple[600]),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Min:",
                      style: TextStyle(color: Colors.deepPurple[600]),
                    ),
                    Text(
                      "${weatherDaysData.main!.tempMin}°C",
                      style: TextStyle(color: Colors.deepPurple[600]),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
