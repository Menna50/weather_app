import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Models/WeatherModel.dart';
import 'package:weather_app/main.dart';

class Cityinfowidget extends StatelessWidget {
  WeatherModel weatherModel;
  Cityinfowidget(this.weatherModel);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:
        [
         getThemeColor(weatherModel.weatherStateName)[500]!,
          getThemeColor(weatherModel.weatherStateName)[300]!,
          getThemeColor(weatherModel.weatherStateName)[50]!
        ]
        )
      ),

height: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: 100,bottom: 100),
        child: SizedBox(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(weatherModel.cityName,
                  style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold ),),
                Text("updated at ${StringToDateTime(weatherModel.updateAt).hour }:${StringToDateTime(weatherModel.updateAt).minute }",
                style: TextStyle(fontSize: 20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Image.network(weatherModel.image),
                    Text("${weatherModel.temp.round().toString()}\u00B0" ,
                    style: TextStyle(fontSize: 36,fontWeight:FontWeight.bold ),),
                    Column(
                      children: [
                        Text("maxTemp ${weatherModel.maxTemp.round().toString()}"),
                        Text("minTemp ${weatherModel.minTemp.round().toString()}")

                      ],
                    )
                  ],
                ),
                Text(weatherModel.weatherStateName,style: TextStyle(fontSize: 32,fontWeight:FontWeight.bold ),)
              ],

          ),
        ),
      ),
    );
  }
}
DateTime StringToDateTime(String value)
{
  return DateTime.parse(value);
}