import 'package:weeather_app/models/Weather_Models.dart';

class WeatherState {}

class initialweatherstate extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModels weather;
  WeatherLoadedState({required this.weather});
}

class WeatherFailureState extends WeatherState {
  final String errorMassege;

  WeatherFailureState({required this.errorMassege});
}
