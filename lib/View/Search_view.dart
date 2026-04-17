import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weeather_app/Cubits/get_weather_state/get_weather_Cubit.dart';
import 'package:weeather_app/models/Weather_Models.dart';
import 'package:weeather_app/services/Weather_Services.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search City',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 16),
        child: TextField(
          onSubmitted: (value) async {
            var getweathercubit = BlocProvider.of<GetWeatherCubit>(context);
            getweathercubit.getWeather(cityName: value);
            Navigator.pop(context);
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            labelText: 'Search',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange, width: 8),
            ),
            suffixIcon: Icon(Icons.search),
            hintText: 'Enter city name',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
