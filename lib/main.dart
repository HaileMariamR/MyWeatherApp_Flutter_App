import 'package:myweatherapp/screens/location_screen.dart';

import 'screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'screens/city_screen.dart';
import 'package:provider/provider.dart';
import 'appstate/AppState.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: CityScreen(),
      ),
    );
  }
}
