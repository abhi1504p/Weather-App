import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/api/fetch_weather_api.dart';
import 'package:weatherapp/models/weather_data.dart';

class GlobalController extends GetxController {
  final RxBool _loading = false.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxDouble _latitude = 0.0.obs;

  RxBool checkLoading() => _loading;

  RxDouble getLongitude() => _longitude;

  RxDouble getLatitude() => _latitude;

  final weatherData = WeatherData().obs;


  WeatherData getData() {

    return weatherData.value;
  }

  @override
  void onInit() {
    _loading.value=true; // Set loading to true before fetching location
    getLocation(); // Always call getLocation
    super.onInit();
  }

  getLocation() async {
    LocationPermission locationPermission;
    bool isServiceEnabled;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      _loading.value = false; // Reset loading on error
      return Future.error("Location services are disabled.");
    }
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      _loading.value = false; // Reset loading on error
      return Future.error(
        "Location permissions are permanently denied, we cannot request permissions.",
      );
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        _loading.value = false; // Reset loading on error
        return Future.error("Location permissions are denied.");
      }
    }

    return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        )
        .then((value) {
          _longitude.value = value.longitude;
          _latitude.value = value.latitude;
          return FetchWeatherApi()
              .processData(value.latitude, value.longitude)
              .then((value) {
                weatherData.value = value;
                _loading.value = false;
              });
        })
        .catchError((error) {
          _loading.value = false;
          throw error;
        });
  }
}
