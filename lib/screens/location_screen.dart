import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myweatherapp/screens/city_screen.dart';
import 'package:myweatherapp/services/weather.dart';
import 'package:myweatherapp/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.result});
  final result;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = WeatherModel();
    double temp = widget.result['main']['temp'] - 273;
    String fTemp = temp.toStringAsFixed(1);
    int conditionValue = widget.result['weather'][0]['id'];
    String conditionMessage = weatherModel.getWeatherIcon(conditionValue);
    String Message = weatherModel.getMessage(temp);
    String cityName = widget.result['name'];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/back.jpg'),
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
                    onPressed: () {
                      setState(() {});
                    },
                    child: Icon(
                      Icons.home,
                      size: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CityScreen()));
                    },
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
                      '$fTemp',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$conditionMessage',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$Message in $cityName ",
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
