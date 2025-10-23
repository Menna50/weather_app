import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Services/WeatherService.dart';
import 'package:weather_app/Widgets/CityInfoWidget.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

import '../Models/WeatherModel.dart';

class Searchpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,

        title: Text("Search city"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            onSubmitted: (value) async {
              print(value);
              var cubit = BlocProvider.of<GetWeatherCubit>(context);
              cubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              labelText: "Search",
              hintText: "Enter city name ",
              suffixIcon: Icon(Icons.search),
              focusedBorder: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
