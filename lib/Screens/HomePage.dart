import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Screens/SearchPage.dart';
import 'package:weather_app/Widgets/CityInfoWidget.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';

import '../Models/WeatherModel.dart';
import 'NoCitySelectedPage.dart';

class HomePage extends StatelessWidget {
  // var  weather = WeatherModel(
  //   cityName: 'Cairo',
  //   updateAt: DateTime.now(),
  //   image: 'assets/images/cloudy.png',
  //   temp: 17,
  //   maxTemp: 17,
  //   minTemp: 16,
  //   weatherStateName: 'Sunny',
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      appBar: AppBar(
       // foregroundColor: Colors.black,
        elevation: 0,
        title: Text("Weather App"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      //  foregroundColor: Theme.of(context).colorScheme.onPrimary,

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Searchpage();
                  },
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoCitySelectedPage();
          }
          else if (state is WeatherLoadedState) {
            return Cityinfowidget(state.weatherModel);
          }
          else

          {
            return Text("Oops there is an error !");
          }
        },
      ),
    );
  }
}
