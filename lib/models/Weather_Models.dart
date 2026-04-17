import 'package:flutter/material.dart';

class WeatherModels {
  final String cityName;
  final DateTime date;
  final double tempC;
  final String weatherState;
  final double maxtemp;
  final double mintemp;
  final String? image;
  WeatherModels({
    required this.cityName,
    required this.date,
    required this.tempC,
    required this.weatherState,
    required this.maxtemp,
    required this.mintemp,
    required this.image,
  });
  factory WeatherModels.fromJson(Map<String, dynamic> json) {
    return WeatherModels(
      cityName: json['location']['name'],

      date: DateTime.now(),

      tempC: double.parse(json['current']['temp_c'].toString()),

      weatherState: json['current']['condition']['text'],

      maxtemp: double.parse(
        json['forecast']['forecastday'][0]['day']['maxtemp_c'].toString(),
      ),

      mintemp: double.parse(
        json['forecast']['forecastday'][0]['day']['mintemp_c'].toString(),
      ),

      image: json['current']['condition']['icon'],
    );
  }
}

MaterialColor getWeatherMaterialColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }

  condition = condition.toLowerCase().trim();

  switch (condition) {
    case 'sunny':
    case 'clear':
      return Colors.orange;

    case 'partly cloudy':
      return Colors.lightBlue;

    case 'cloudy':
    case 'overcast':
      return Colors.blueGrey;

    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.grey;

    case 'patchy rain possible':
    case 'patchy light rain':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.blue;

    case 'thundery outbreaks possible':
      return Colors.deepPurple;

    default:
      return Colors.blue;
  }
}
