import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weathermodel.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "c0ac2559076f4708913140107242607";
  WeatherService(this.dio);
  Future<Weathermodel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      // log(response.data.toString());

      Weathermodel weathermodel = Weathermodel.fromJson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Opps! there is an error , try later !!';
      log(e.toString());
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Opps! there is an error , try later !!');
    }
  }
}
