import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_waether_states.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/Widgets/noWeather.dart';
import 'package:weather_app/Widgets/weatherInfo.dart';
import 'package:weather_app/screens/SearchView.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Weather App",
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 28,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Searchview();
                }));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is LoadedWeatherState) {
            // ignore: prefer_const_constructors
            return WeatherInfoBody();
          } else if (state is NoWeatherState) {
            return const NoWeatherBody();
          } else {
            return const Center(
              child: Text('Opps ! There is an error !'),
            );
          }
        },
      ),
    );
  }
}
