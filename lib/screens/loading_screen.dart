import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:myweatherapp/screens/city_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  var currentValue = "";

  void getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    currentValue =
        position.latitude.toString() + " and " + position.longitude.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: ElevatedButton(
            onPressed: () {
              setState(() {
                getCurrentLocation();
              });
            },
            child: Text("GetCurrentLocation"),
          )),
          Expanded(
              child: (currentValue == "")
                  ? SpinKitWave(
                      size: 100,
                      color: Colors.pink,
                    )
                  : Text("$currentValue"))
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