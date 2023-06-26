import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/blocs/weather/weather_bloc.dart';

class ShowMarker extends StatelessWidget {
  const ShowMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          const Positioned(
            top: 70,
            left: 20,
            child: BtnBack(),
          ),
          Center(
            child: Transform.translate(
              offset: const Offset(0, -20),
              child: const Icon(
                Icons.location_on_rounded,
                size: 50,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 40,
            child: MaterialButton(
              minWidth: size.width - 90,
              color: Colors.deepPurpleAccent,
              elevation: 0,
              height: 50,
              shape: const StadiumBorder(),
              onPressed: () async {
                weatherBloc.add(GetDaysWeather());
                Navigator.pop(context);
              },
              child: const Text(
                "Confirmar ubicación",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BtnBack extends StatelessWidget {
  const BtnBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 25,
      backgroundColor: Colors.white,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
    );
  }
}
