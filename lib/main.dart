import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weeather_app/Cubits/get_weather_state/Get_Weather_states.dart';
import 'package:weeather_app/Cubits/get_weather_state/get_weather_Cubit.dart';
import 'package:weeather_app/models/Weather_Models.dart';
import 'package:weeather_app/pages/Home_View.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            final color = getWeatherMaterialColor(
              BlocProvider.of<GetWeatherCubit>(
                context,
              ).weathermodel?.weatherState,
            );

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: color,
                appBarTheme: AppBarTheme(
                  // backgroundColor: color,
                  foregroundColor: Colors.white,
                ),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}
