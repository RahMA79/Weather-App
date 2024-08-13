import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubits/get_weather_cubit/get_waether_states.dart';
import 'package:weather_app/models/weathermodel.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  Weathermodel? weatherModel;
  getWeather(cityName) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      log(weatherModel!.cityName);
      emit(LoadedWeatherState());
    } catch (e) {
      log(e.toString());
      emit(FailureWeatherState());
    }
  }
}
