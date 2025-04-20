import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:intl/intl.dart';

class HeaderWidget extends StatefulWidget {
  HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());

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
    Placemark placemark = placemarks[0];
    setState(() {
      city = placemark.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.topLeft,
              child: Text(city, style: TextStyle(fontSize: 30, height: 1.7)),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              alignment: Alignment.topLeft,
              child: Text(
                date,
                style: TextStyle(
                  fontSize: 15,
                  height: 1,

                  color: Colors.grey[700],
                ),
              ),
            ),

          ],
        ),
      ],
    );
  }
}
