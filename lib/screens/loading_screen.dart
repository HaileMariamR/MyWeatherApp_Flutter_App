import 'dart:developer';

import 'package:flutter/material.dart';
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
    await userLocation.getLocation;
    lon = userLocation.longtitude;
    lat = userLocation.latitude;
    AnyNetworkData networkData = AnyNetworkData(
        url:
            "https://api.weatherbit.io/v2.0/current?lat=$lat&lon=$lon&key=7a20949786ad47fe84f5621842568b80");

    var result = await networkData.getData();
    double temprature = result['data'][0]['temp'];
    String timeZone = result['data'][0]['timezone'];
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Expanded(
          //     child: ElevatedButton(
          //   onPressed: () {
          //     setState(() {});
          //   },
          //   child: Text("GetCurrentLocation"),
          // )),
          // Expanded(
          //     child: (currentValue == "")
          //         ? SpinKitWave(
          //             size: 100,
          //             color: Colors.pink,
          //           )
          //         : Text("$currentValue"))
        ],
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