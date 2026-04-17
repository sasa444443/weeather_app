import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weeather_app/Cubits/get_weather_state/Get_Weather_states.dart';
import 'package:weeather_app/models/Weather_Models.dart';
import 'package:weeather_app/services/Weather_Services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(initialweatherstate());
  WeatherModels? weathermodel;
  getWeather({required String cityName}) async {
    try {
      weathermodel = await WeatherServices(
        Dio(),
      ).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weather: weathermodel!));
    } catch (e) {
      emit(WeatherFailureState(errorMassege: e.toString()));
    }
  }
}
