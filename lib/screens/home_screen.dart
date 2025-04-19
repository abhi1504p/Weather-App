import 'package:flutter/material.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:weatherapp/widgets/current_weather_widget.dart';
import 'package:weatherapp/widgets/header_widget.dart';

import '../models/Weather_data_current.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () =>
              globalController.checkLoading().isTrue
                  ? Center(child: CircularProgressIndicator())
                  : Center(
                    child: Center(
                      child: ListView(
                        children: [
                          SizedBox(height: 50,),
                         HeaderWidget(),
                          CurrentWeatherWidget(
                            weatherDataCurrent: globalController.getData().getCurrentWeather() ??
                                WeatherDataCurrent(
                                    current: Current(name: "No Data Available")
                                ),
                          ),

                        ],
                      ),
                    )
                  ),
        ),
      ),
    );
  }
}
