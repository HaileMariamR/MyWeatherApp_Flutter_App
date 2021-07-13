import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myweatherapp/utilities/constants.dart';
import 'package:myweatherapp/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.result});
  final result;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}
//  double temprature = result['data'][0]['temp'];
//   String timeZone = result['data'][0]['timezone'];

class _LocationScreenState extends State<LocationScreen> {
  int temp = 0;
  int condition = 0;
  String cityName = "";
  String message = "";
  String icon = "";

  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUi(widget.result);
  }

  void updateUi(dynamic weatherdata) {
    temp = weatherdata['main']['temp'];
    condition = weatherdata['weather'][0]['id'];
    cityName = weatherdata['name'];
    message = weatherModel.getMessage(temp);
    icon = weatherModel.getWeatherIcon(condition);
  }

  @override
  Widget build(BuildContext context) {
    double temp = widget.result['data'][0]['temp'];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_back.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$icon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
