class WeatherModel
{
  String cityName;
  String updateAt;
  String image;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  WeatherModel({required this.cityName, required this.updateAt,
    required this.image,required this.temp,required this.maxTemp,
    required this.minTemp,required this.weatherStateName});
  factory WeatherModel.fromJson(json)
  {
    return WeatherModel(cityName: json['location']['name']
        ,updateAt: json['current']['last_updated']
        , image: "https:${json['forecast']['forecastday'][0]['day']['condition']['icon']}"
        ,
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherStateName: json['forecast']['forecastday'][0]['day']['condition']['text']
    );
  }
}