import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/presentation/home/components/body.dart';
import 'package:flutter_travel_ui/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
  
}