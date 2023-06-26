import 'package:flutter/material.dart';
import 'package:weather_app/ui/pages/map/marker_location.dart';
import 'package:weather_app/ui/pages/map/show_map.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          ShowMap(),
          ShowMarker(),
        ],
      ),
    );
  }
}
