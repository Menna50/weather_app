import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';

import 'Screens/HomePage.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (context)=>GetWeatherCubit(),
     child: Builder(
       builder:(context)=> BlocBuilder<GetWeatherCubit,WeatherState>(
         builder:(context,state)=> MaterialApp
           (
           theme: ThemeData(
             // Define the default brightness and colors.
             colorScheme: ColorScheme.fromSeed(
               seedColor:getThemeColor( BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherStateName,
             ),
               // ···
           //    brightness: Brightness.light,
             ),
           ),

             debugShowCheckedModeBanner: false,
           home: HomePage(),
         ),
       ),
     ),
   );
  }
}
MaterialColor getThemeColor(String? condition) {
  if(condition == null)
    return Colors.blue;

  final lower = condition.toLowerCase();

  // ☀️ Sunny / Clear
  if (lower.contains('sunny') || lower.contains('clear')) {
    return Colors.amber;
  }

  // 🌤 Partly Cloudy / Cloudy / Overcast
  if (lower.contains('cloud') || lower.contains('overcast')) {
    return Colors.blueGrey;
  }

  // 🌫 Mist / Fog
  if (lower.contains('mist') || lower.contains('fog')) {
    return Colors.grey;
  }

  // 🌦 Drizzle / Light Rain / Patchy rain
  if (lower.contains('drizzle') || lower.contains('patchy light rain') || lower.contains('light rain')) {
    return Colors.lightBlue;
  }

  // 🌧 Moderate to Heavy Rain
  if (lower.contains('moderate rain') || lower.contains('heavy rain') || lower.contains('torrential')) {
    return Colors.indigo;
  }

  // ❄️ Snow / Blizzard / Ice / Sleet
  if (lower.contains('snow') || lower.contains('sleet') || lower.contains('ice') || lower.contains('blizzard')) {
    return Colors.cyan;
  }

  // 🌩 Thunder / Storm
  if (lower.contains('thunder')) {
    return Colors.deepPurple;
  }

  // 🌨 Freezing / Cold mix
  if (lower.contains('freezing')) {
    return Colors.teal;
  }

  // Default fallback
  return Colors.blue;
}