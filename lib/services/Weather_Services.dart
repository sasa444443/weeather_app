import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weeather_app/models/Weather_Models.dart';

class WeatherServices {
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'fc604cdfbfd84bc9a0375118261103';

  final Dio dio;

  WeatherServices(this.dio);

  Future<WeatherModels> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1',
      );
      WeatherModels weatherModel = WeatherModels.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMassege =
          e.response?.data['error']['message'] ??
          "Ooops there was an error , try later";
      throw Exception(errorMassege);
    } catch (e) {
      log(e.toString());
      throw Exception("Oops there was an error, please try again later");
    }
  }
}
