class WeatherState {
  get weatherModel => null;
}

class NoWeatherState extends WeatherState {}

class LoadedWeatherState extends WeatherState {}

class FailureWeatherState extends WeatherState {}
