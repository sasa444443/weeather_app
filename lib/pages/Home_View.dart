import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weeather_app/Cubits/get_weather_state/Get_Weather_states.dart';
import 'package:weeather_app/Cubits/get_weather_state/get_weather_Cubit.dart';
import 'package:weeather_app/View/Search_view.dart';
import 'package:weeather_app/widgets/No_weatherBody.dart';
import 'package:weeather_app/widgets/Weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchView()),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text(
          'Weather App',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is initialweatherstate) {
            return const NoWeatherbody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(weather: state.weather);
          } else if (state is WeatherFailureState) {
            return Center(
              child: Text(
                'Opps there was an error , please try again.',
                style: TextStyle(fontSize: 18, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
