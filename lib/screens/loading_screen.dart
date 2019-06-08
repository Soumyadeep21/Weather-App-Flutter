import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

const apiKey = '17c4e421f91f1b18b26186f87330a6b7';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double longitude;
  double latitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    longitude = location.longitude; 
    latitude = location.latitude;
    NetworkHelper networkHelper = NetworkHelper(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'
    );
    var weatherData = await networkHelper.getData();
    var temp = weatherData['main']['temp'];
    var condition = weatherData['weather'][0]['id'];
    var city = weatherData['name'];
    print(' $city  $temp  $condition');    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
