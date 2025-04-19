import 'dart:convert';
import 'package:weatherapp/models/Weather_data_current.dart';
import 'package:weatherapp/models/weather_data.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_dotenv/flutter_dotenv.dart';
class FetchWeatherApi {
  WeatherData? weatherData;

  // prcesses the data from response to json
  Future<WeatherData> processData(lat, lon) async {
    try {
      var response = await http.get(Uri.parse(apiUrl(lat, lon)));
      // Debug log

      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body);
        if (jsonString != null) {
          weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));
          return weatherData!;
        }
      }
      throw Exception("Failed to fetch weather data: ${response.statusCode}");
    } catch (e) {
      print("Error processing data: $e");
      throw Exception("Error processing weather data");
    }
  }
}

String apiUrl(var lat, var log) {
  final apiKey = dotenv.env['API_KEY'] ?? '';
  return "https://api.openweathermap.org/data/2.5/weather?appid=$apiKey&lon=$log&lat=$lat";
}
