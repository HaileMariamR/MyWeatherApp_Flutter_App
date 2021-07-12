import 'package:geolocator/geolocator.dart';

class UserLocation {
  double? latitude;
  double? longtitude;

  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longtitude = position.longitude;
    } catch (e) {
      print("$e");
    }
  }
}
