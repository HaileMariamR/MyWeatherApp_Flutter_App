import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:myweatherapp/screens/city_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';
import 'package:myweatherapp/services/location.dart';
import 'package:http/http.dart';
import 'package:myweatherapp/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? lat;
  double? lon;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentLocationWeatherData();
  }

  void currentLocationWeatherData() async {
    UserLocation userLocation = UserLocation();
    Position currentLocation = await userLocation.getLocation();
    lon = currentLocation.longitude;
    lat = currentLocation.latitude;
    AnyNetworkData networkData = AnyNetworkData(
        url:
            "api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=8b7f58a68137c0497d75668ddf58a1ba&units=metric");

    var result = await networkData.getData();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  result: result,
                )));
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































































//  String currentLocation = "";
//   int value = 1;

//   void getDataFromWeb() async {
//     var result = await get(Uri.parse(
//         'https://datausa.io/api/data?drilldowns=Nation&measures=Population'));
//     var r = jsonDecode(result.body);
//     print(r['data'][0]['Nation']);
//   }

//   void getLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     currentLocation = position.latitude.toString();
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }