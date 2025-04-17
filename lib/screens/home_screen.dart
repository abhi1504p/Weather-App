import 'package:flutter/material.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:weatherapp/widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () =>
            globalController.checkLoading().isTrue
                ? Center(child: CircularProgressIndicator())
                : Center(
                  child: ListView(
                    children: [
                     HeaderWidget(),
                    ],
                  )
                ),
      ),
    );
  }
}
