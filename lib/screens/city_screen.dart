import 'package:flutter/material.dart';
import 'package:myweatherapp/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'location_screen.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    fillColor: Colors.purple,
                    hintStyle: TextStyle(color: Colors.black),
                    hintText: "Enter Country Name",
                    border: UnderlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    http.Response response = await http.get(Uri.parse(
                        "https://api.openweathermap.org/data/2.5/weather?q=${myController.text}&appid=8b7f58a68137c0497d75668ddf58a1ba"));

                    var result = jsonDecode(response.body);
                    if (!result) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LocationScreen(result: result)));
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
