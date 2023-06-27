import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  final String humidity;
  final String feelsLike;
  final String pressure;
  const AdditionalInfo({
    Key? key,
    required this.humidity,
    required this.feelsLike,
    required this.pressure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple[50],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  pressure,
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 30,
                  ),
                ),
                Icon(
                  Icons.houseboat,
                  color: Colors.deepPurple[300],
                ),
                Text("Presión", style: TextStyle(color: Colors.deepPurple[600]))
              ],
            ),
            Column(
              children: [
                Text(
                  feelsLike,
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 30,
                  ),
                ),
                Icon(
                  Icons.sunny_snowing,
                  color: Colors.deepPurple[300],
                ),
                Text(
                  "Sensación",
                  style: TextStyle(color: Colors.deepPurple[600]),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  humidity,
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 30,
                  ),
                ),
                Icon(
                  Icons.water_drop_rounded,
                  color: Colors.deepPurple[300],
                ),
                Text("Humedad", style: TextStyle(color: Colors.deepPurple[600]))
              ],
            )
          ],
        ),
      ),
    );
  }
}
