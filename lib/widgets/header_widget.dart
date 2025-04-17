import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  GlobalController globalController = Get.find<GlobalController>();

  @override
  void initState() {
    // TODO: implement initState
    getAddress(
      globalController.getLatitude().value,
      globalController.getLongitude().value,
    );
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    print(placemarks);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [Container(child: Text(""))]);
  }
}
