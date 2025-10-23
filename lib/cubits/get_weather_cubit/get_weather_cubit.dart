import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/WeatherModel.dart';

import '../../Services/WeatherService.dart';
import 'get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherState>
{
  WeatherModel? weatherModel;
  GetWeatherCubit():super(WeatherInitialState());

 getWeather({required String cityName}) async{

  try {
    WeatherService weatherService = WeatherService();
     weatherModel = await weatherService
        .getCurrentWeather(cityName);
    emit(WeatherLoadedState(weatherModel!));

  }
  on Exception catch (e) {
    emit(WeatherFailureState(e.toString()));
  }
}
}