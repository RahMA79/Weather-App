import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_weather_cubit.dart';
// import 'package:weather_app/models/weathermodel.dart';
// import 'package:weather_app/services/weather_service.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: const Text(
          "Search a city",
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              fontSize: 28),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              BlocProvider.of<GetWeatherCubit>(context).getWeather(value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    )),
                hintText: 'Enter city name',
                suffixIcon: const Icon(Icons.search),
                iconColor: (Colors.blue),
                labelText: 'Search',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 16)),
          ),
        ),
      ),
    );
  }
}
