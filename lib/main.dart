import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weatherapp/screens/home_screen.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';


void main() async {  // Make this async
  await dotenv.load(fileName: ".env");  // Add this line
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),

      debugShowCheckedModeBanner: false,
      title: "Weather App",
    );
  }
}
