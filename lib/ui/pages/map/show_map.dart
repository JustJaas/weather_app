import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/ui/blocs/weather/weather_bloc.dart';

class ShowMap extends StatelessWidget {
  const ShowMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(
        double.parse(weatherBloc.state.lat),
        double.parse(weatherBloc.state.lng),
      ),
      zoom: 8,
    );
    return SizedBox(
      child: Listener(
        child: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          compassEnabled: false,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          onCameraMove: (position) {
            weatherBloc.add(SetCoords(
              tempLat: position.target.latitude.toString(),
              tempLng: position.target.longitude.toString(),
            ));
          },
        ),
      ),
    );
  }
}
