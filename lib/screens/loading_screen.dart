// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:myweatherapp/appstate/AppState.dart';
// import 'location_screen.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:provider/provider.dart';

// class LoadingScreen extends StatefulWidget {
//   const LoadingScreen({Key? key}) : super(key: key);

//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }

// class _LoadingScreenState extends State<LoadingScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   Object result = {};
//   @override
//   Widget build(BuildContext context) {
//     var appstate = Provider.of<CurrentCityWeatherState>(context);

//     return Scaffold(
//       appBar: AppBar(),
//       drawer: Drawer(),
//       body: Container(
//         child: Center(
//           child: MaterialButton(
//               onPressed: () => {
//                     appstate.getCurrentCityDataFromApi(),
//                     result = appstate.getCurrentCityData,
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 LocationScreen(result: result)))
//                   },
//               child: Text("Get Weather Data")),
//         ),
//       ),
//     );
//   }
// }
