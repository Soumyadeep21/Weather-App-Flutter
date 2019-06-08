import 'dart:convert';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apiKey = '110cd7bf3dae1b06bbe0689e00d2badc';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('Longitude : ${location.longitude}  Latitude : ${location.latitude}');
  }

  void getData() async {
    http.Response response = await http.get(
      'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22',
    );
    var weather = jsonDecode(response.body);
    var temp = weather['main']['temp'];
    var condition = weather['weather'][0]['id'];
    var city = weather['name'];
    print(' $city  $temp  $condition');
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
