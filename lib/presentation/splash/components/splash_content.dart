import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_travel_ui/size_config.dart';

class SplashContent extends StatelessWidget {

  const SplashContent({ Key? key, this.text, this.image}) : super(key: key);

  final String? text,image;
  
  Widget _buildSvgImg(String imgUrl, double width, double height) {
    return SvgPicture.asset(imgUrl, width: width,height: height);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildSvgImg(image!, getProportionateScreenWidth(400), getProportionateScreenHeight(300)),
        SizedBox(height: getProportionateScreenHeight(20),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Text('Never more in rush',style: TextStyle(
                fontSize: getProportionateScreenWidth(55),

              ),),
              Text('Check and keep under controll your daily task, is a creative way',style: TextStyle(
                fontSize:getProportionateScreenWidth(18),
              ),
              )
            ],
          ),
        )

      ],
    );
  }

}