
import 'package:weather_app/Models/WeatherModel.dart';

class WeatherState{}
class WeatherInitialState extends WeatherState
{}
class WeatherLoadedState extends WeatherState
{
  WeatherModel weatherModel;
  WeatherLoadedState(this.weatherModel);
}
class WeatherFailureState extends WeatherState
{
  final String errorMessage;
  WeatherFailureState(this.errorMessage);

}