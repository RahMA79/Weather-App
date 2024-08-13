import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_waether_states.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/screens/splash_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getWeatherColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherstatus,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const SplashScreen(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) return Colors.blue;
  switch (condition) {
    case "Sunny":
    case "Clear":
      return Colors.amber;

    case "Partly cloudy":
    case "Patchy light rain":
    case "Light rain":
    case "Patchy rain possible":
      return Colors.lightBlue;

    case "Cloudy":
    case "Overcast":
    case "Mist":
    case "Fog":
      return Colors.grey;

    case "Patchy snow possible":
    case "Light snow":
    case "Patchy light snow":
    case "Moderate snow":
    case "Heavy snow":
      return Colors.blue;

    case "Patchy sleet possible":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Patchy freezing drizzle possible":
    case "Freezing drizzle":
    case "Patchy light drizzle":
    case "Light drizzle":
      return Colors.cyan;

    case "Thundery outbreaks possible":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.deepPurple;

    case "Blowing snow":
    case "Blizzard":
      return Colors.blueGrey;

    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Torrential rain shower":
    case "Light rain shower":
    case "Moderate or heavy rain shower":
      return Colors.blue;

    case "Ice pellets":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.lightBlue;

    default:
      return Colors.blueGrey; // Default color if no match is found
  }
}
