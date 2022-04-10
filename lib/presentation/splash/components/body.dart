
import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/common/contains.dart';
import 'package:flutter_travel_ui/presentation/splash/components/splash_content.dart';
import 'package:flutter_travel_ui/size_config.dart';

import '../../home/home_screen.dart';

class Body extends StatefulWidget {
  @override
    _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tokoto, Let’s shop!",
      "image": "assets/images/1.svg"
    },
    {
      "text":
      "We help people conect with store \naround United State of America",
      "image": "assets/images/2.svg"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/3.svg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Spacer(),
            Expanded(
              flex: 4,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]['text'],
                  image: splashData[index]['image'],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(30)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                            (index) => buildDot(index: index),
                      ),
                    ),
                    // If carousel finish . enable check btn .
                    if (currentPage == 2) _buildDoneBtn()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

  }

  GestureDetector _buildDoneBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, HomeScreen.routeName);
      },
      child: Container(
        height: getProportionateScreenHeight(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.blue.shade50
        ),
        child: Icon(Icons.arrow_forward,color: Colors.lightBlue,),
      ),
    );
  }
  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Color(0xFFB5D1E0) : Color(0xFF74C2E0),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}