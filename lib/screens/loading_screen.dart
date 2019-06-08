import 'dart:convert';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    longitude = location.longitude; 
    latitude = location.latitude;
    getData();
  }

  void getData() async {
    http.Response response = await http.get(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey',
    );
    if(response.statusCode == 200){
      var weather = jsonDecode(response.body);
    var temp = weather['main']['temp'];
    var condition = weather['weather'][0]['id'];
    var city = weather['name'];
    print(' $city  $temp  $condition');
    }
    else
    print(response.statusCode);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
