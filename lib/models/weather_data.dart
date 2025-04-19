import 'package:weatherapp/models/Weather_data_current.dart';

class WeatherData {
  final WeatherDataCurrent? current;

  WeatherData([this.current]);

  WeatherDataCurrent? getCurrentWeather() => current; // Remove force unwrap
}