


import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/presentation/home/home_screen.dart';
import 'package:flutter_travel_ui/presentation/splash/splash_screen.dart';


final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};