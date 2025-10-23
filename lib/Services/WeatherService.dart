import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/Models/WeatherModel.dart';

class WeatherService {
  final baseURL="http://api.weatherapi.com/v1";
  final String apiKey="bce192701f504a5fa12134404252010";
  Dio dio = Dio();

  Future<WeatherModel> getCurrentWeather(String city) async {
    var weather;

    try {
      String api="${baseURL}/forecast.json?key=${apiKey}&q=${city}&days=1";
      Response response = await dio.get( api );
      print("TestAPIII");
      print(api);


      weather = WeatherModel.fromJson(response.data);
      return weather;
    }
    on DioException catch (e)
    {
  final  String erroMessage=e.response?.data['error']['message']??"oops! there is an error ,try later.";
    throw Exception(erroMessage);
    }
    catch(e)
    {
      print("EXXXXX");
      print(e.toString());
      throw Exception('try later');

    }
  }
}
