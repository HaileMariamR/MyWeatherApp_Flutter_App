import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

class AppState extends ChangeNotifier {
  List _currentWeatherData = [];

  List get getWeatherData => _currentWeatherData;

  bool isFetchingApiData = false;

  Future<void> setHomeCityWeatherData() async {
    isFetchingApiData = true;
    notifyListeners();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      String url1 =
          "https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=8b7f58a68137c0497d75668ddf58a1ba";

      http.Response response = await http.get(Uri.parse(url1));
      if (response.statusCode == 200) {
        _currentWeatherData = [jsonDecode(response.body)];
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
    isFetchingApiData = false;
    notifyListeners();
  }

  Future<void> setWeatherData(String name) async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?q=${name}&appid=8b7f58a68137c0497d75668ddf58a1ba";
    isFetchingApiData = true;
    notifyListeners();
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        _currentWeatherData = [jsonDecode(response.body)];
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
    isFetchingApiData = false;

    notifyListeners();
  }
}
