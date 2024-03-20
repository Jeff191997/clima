import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

const apiKey = 'f90d2213c98e1bccdd668ca7859f0343';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(Uri.parse('https://api'
        '.openweathermap.org/data/2'
        '.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));

    var weatherData = await networkHelper.getData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

// LocationPermission permission;
// permission = await Geolocator.checkPermission();
// permission = await Geolocator.requestPermission();
// if (permission == LocationPermission.denied) {
//   //nothing
// }

// int condition = weatherData['weather'][0]['id'];
// double temperature = weatherData['main']['temp'];
// String cityName = weatherData['name'];
