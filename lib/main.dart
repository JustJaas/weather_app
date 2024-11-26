import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:weather_app/ui/blocs/weather/weather_bloc.dart';
import 'package:weather_app/ui/pages/splash_page.dart';

// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://36a02f832fd7350ff74e414ce07f826f@o4508367170502656.ingest.us.sentry.io/4508367173910528';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(const MyApp()),
  );

  // or define SENTRY_DSN via Dart environment variable (--dart-define)
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WeatherBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
          scaffoldBackgroundColor: Colors.deepPurple[100],
        ),
        home: const SplashPage(),
      ),
    );
  }
}
