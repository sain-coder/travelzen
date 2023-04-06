import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travelzen/HomeScreens/Restuarant.dart';
import 'package:travelzen/HomeScreens/cars.dart';
import 'package:travelzen/HomeScreens/hotels.dart';
import 'package:travelzen/HomeScreens/spots.dart';
//import 'package:travelzen/adminpage.dart';
import 'package:travelzen/Signin.dart';
import 'package:travelzen/Signup.dart';
import 'package:travelzen/HomeScreens/googlemap.dart';
import 'package:travelzen/HomeScreens/home.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const TravelZen());
}
class TravelZen extends StatelessWidget {
  const TravelZen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signup(),
      // home: Signup(),
      routes: {
         '/signin': (context) => const Signin(),
        '/signup': (context) => const Signup(),
        '/homedirect':(context) => const HomeDirect(),
        '/maponly':(context) => const MapOnly(),
        '/rest':(context) => const Restuarants(),
        '/vehicles':(context) => const Vehicles(),
        '/hotels':(context) => const Hotels(),
        '/spots':(context) => const SpotsView(),
        
       },
    );
  }
}

