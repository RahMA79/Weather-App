class Weathermodel {
  final String cityName;
  final DateTime date;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherstatus;

  Weathermodel({
    required this.cityName,
    required this.date,
    required this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherstatus,
  });
  factory Weathermodel.fromJson(json) {
    return Weathermodel(
      cityName: json["location"]['name'],
      date: DateTime.parse(json["current"]["last_updated"]),
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      weatherstatus: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
    );
  }
}
