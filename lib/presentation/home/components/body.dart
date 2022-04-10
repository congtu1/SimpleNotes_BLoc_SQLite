import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/common/contains.dart';
import 'package:flutter_travel_ui/presentation/home/components/taskitem.dart';
import 'package:flutter_travel_ui/presentation/newtask/view/newtask_page.dart';
import 'package:flutter_travel_ui/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.lightBlue.shade200,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'My task',
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(40)),
                        ),
                        Text(
                          'You have 4 task today',
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(20)),
                        )
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.lightBlue),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: TaskItem(),
            ),
            // Container(
            //   height: 20,
            //   margin: EdgeInsets.only(
            //       left: getProportionateScreenWidth(150), top: 15),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children:
            //             List.generate(3, (index) => buildDot(index: index)),
            //       )
            //     ],
            //   ),
            // ),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> AddNewTask()));
              },
              child: Ink(
                width: 70,
                height: 70,
                padding: EdgeInsets.all(20),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Icon(
                  Icons.add,
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // AnimatedContainer buildDot({required int index}) {
  //   return AnimatedContainer(
  //     duration: kAnimationDuration,
  //     margin: EdgeInsets.only(right: 5),
  //     height: currentPage == index ? 5 : 4,
  //     width: currentPage == index ? 25 : 10,
  //     decoration: BoxDecoration(
  //       color: currentPage == index ? Color(0xFFB5D1E0) : Color(0xFF74C2E0),
  //       borderRadius: BorderRadius.circular(3),
  //     ),
  //   );
  // }
}
