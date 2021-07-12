import 'package:http/http.dart';
import 'dart:convert';

class AnyNetworkData {
  AnyNetworkData({required this.url});
  final String url;

  Future getData() async {
    var data = await get(Uri.parse(url));
    if (data.statusCode == 200) {
      var jsondata = jsonDecode(data.body);
      return jsondata;
    }
  }
}
