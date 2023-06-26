import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/blocs/gps/gps_bloc.dart';
import 'package:weather_app/ui/pages/map/map_page.dart';
import 'package:weather_app/ui/pages/map/gps_permission_page.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return state.isAllGranted
              ? const MapPage()
              : const GpsPermissionPage();
        },
      ),
    );
  }
}
