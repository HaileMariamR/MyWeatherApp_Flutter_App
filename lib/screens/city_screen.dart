import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myweatherapp/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:myweatherapp/appstate/AppState.dart';
import 'location_screen.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_back.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  onPressed: () async {
                    await appState.setHomeCityWeatherData();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocationScreen(
                                result: appState.getWeatherData[0])));
                  },
                  child: Icon(
                    Icons.home,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                      controller: myController,
                      maxLines: null,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: "Enter Country name here ...",
                        hintStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ))),
              ElevatedButton(
                onPressed: () async {
                  await appState.setWeatherData(myController.text);
                  // print(appState.getWeatherData[0]['main']);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LocationScreen(
                              result: appState.getWeatherData[0])));
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
              (!appState.isFetchingApiData)
                  ? Text("")
                  : SpinKitRing(
                      color: Colors.black,
                      size: 50,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
