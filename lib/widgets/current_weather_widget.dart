import 'package:flutter/material.dart';
import 'package:weatherapp/models/Weather_data_current.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  CurrentWeatherWidget({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Column(children: [
        temperatueAreaWidget(),
         currentWeatherMoreDetail(),
      ],),
    );
  }

  Widget currentWeatherMoreDetail() {
    return Container(

    );
  }
  }

Widget temperatueAreaWidget() {
  return Container(

  );
}
