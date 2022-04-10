import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/presentation/home/components/body.dart';

class HomeScreen extends StatelessWidget {

  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
  
}