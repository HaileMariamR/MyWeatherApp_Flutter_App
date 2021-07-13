import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myweatherapp/screens/city_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';
import 'package:myweatherapp/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:myweatherapp/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat = 1.0;
  double lon = 1.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentLocationWeatherData();
  }

  void currentLocationWeatherData() async {
    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    // lon = position.longitude;
    // lat = position.latitude;

    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=9.025&lon=38.7469&appid=8b7f58a68137c0497d75668ddf58a1ba"));

    var result = jsonDecode(response.body);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(result: result)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitRing(
        color: Colors.white,
        size: 100,
      ),
    ));
  }
}
