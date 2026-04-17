import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weeather_app/Cubits/get_weather_state/get_weather_Cubit.dart';
import 'package:weeather_app/models/Weather_Models.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});
  final WeatherModels weather;
  @override
  Widget build(BuildContext context) {
    WeatherModels weathermodel = BlocProvider.of<GetWeatherCubit>(
      context,
    ).weathermodel!;

    final MaterialColor color = getWeatherMaterialColor(
      weathermodel.weatherState,
    );

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [color, color.shade300, color.shade100],
            ),
          ),
        ),

        if (weathermodel.weatherState.toLowerCase().contains('sunny') ||
            weathermodel.weatherState.toLowerCase().contains('clear'))
          Positioned(
            top: 60,
            right: 30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow.withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.6),
                    blurRadius: 50,
                    spreadRadius: 20,
                  ),
                ],
              ),
            ),
          ),

        if (weathermodel.weatherState.toLowerCase().contains('rain'))
          ...List.generate(50, (index) {
            return Positioned(
              left: (index * 20).toDouble(),
              top: (index * 15 % 600).toDouble(),
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: -100.0, end: 800.0),
                duration: Duration(milliseconds: 1000 + index * 30),
                curve: Curves.linear,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, value),
                    child: Container(
                      width: 2,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
              ),
            );
          }),

        if (weathermodel.weatherState.toLowerCase().contains('cloud') ||
            weathermodel.weatherState.toLowerCase().contains('rain'))
          ...List.generate(2, (cloudIndex) {
            return Positioned(
              top: 70.0 + cloudIndex * 90,
              left: 20.0 + cloudIndex * 120,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: -15, end: 15),
                    duration: Duration(seconds: 4 + cloudIndex),
                    curve: Curves.easeInOut,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(value, 0),
                        child: Opacity(
                          opacity: 0.35,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 130,
                                height: 55,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              Positioned(
                                left: 15,
                                top: 0,
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 18,
                                top: -8,
                                child: Container(
                                  width: 65,
                                  height: 65,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 45,
                                top: -18,
                                child: Container(
                                  width: 55,
                                  height: 55,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  ...List.generate(12, (rainIndex) {
                    return TweenAnimationBuilder<double>(
                      tween: Tween(begin: -10, end: 40),
                      duration: Duration(milliseconds: 700 + rainIndex * 80),
                      curve: Curves.linear,
                      builder: (context, value, child) {
                        return Positioned(
                          left: 15.0 + rainIndex * 9,
                          top: 55 + value,
                          child: Opacity(
                            opacity: 0.5,
                            child: Container(
                              width: 2,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ],
              ),
            );
          }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Spacer(flex: 6),

              Text(
                weathermodel.cityName,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                'Updated at ${weathermodel.date.hour}:${weathermodel.date.minute}',
                style: const TextStyle(fontSize: 21),
              ),

              const Spacer(flex: 1),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    'https:${weathermodel.image!}',
                    width: 150,
                    height: 150,
                  ),

                  Text(
                    '${weathermodel.tempC.round()}°',
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Column(
                    children: [
                      Text('maxTemp: ${weathermodel.maxtemp.round()}'),
                      Text('minTemp: ${weathermodel.mintemp.round()}'),
                    ],
                  ),
                ],
              ),

              const Spacer(flex: 1),

              Text(
                weathermodel.weatherState,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(flex: 6),
            ],
          ),
        ),
      ],
    );
  }
}
