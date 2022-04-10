import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_ui/data/models/task_model.dart';
import 'package:flutter_travel_ui/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_travel_ui/presentation/home/bloc/home_event.dart';
import 'package:flutter_travel_ui/presentation/home/bloc/home_state.dart';
import 'package:flutter_travel_ui/size_config.dart';

// ignore: must_be_immutable
class TaskItem extends StatefulWidget {
  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  PageController? pageController;

  double viewportFraction = 0.8;

  double? pageOffset = 0;

  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: 0, viewportFraction: viewportFraction)
          ..addListener(() {
            setState(() {
              pageOffset = pageController!.page;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.tasks != current.tasks,
      builder: (context, state) {
        switch (state.status) {
          case HomeStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case HomeStatus.failure:
            return const Center(
              child: Text("Fetch data failed"),
            );
          case HomeStatus.success:
            if (state.tasks.isEmpty) {
              return const Center(
                child: Text("No data"),
              );
            }
            return PageView.builder(

              controller: pageController,
              // onPageChanged: (value) {
              //   setState(() {
              //     widget.currentPage = value;
              //     widget.callback(widget.currentPage);
              //
              //   });
              // },
              itemBuilder: (context, index) {
                List<Task> data = state.tasks.reversed.toList();
                double scale = max(viewportFraction,
                    (1 - (pageOffset! - index).abs()) + viewportFraction);

                double angle = (pageOffset! - index).abs();

                if (angle > 0.5) {
                  angle = 1 - angle;
                }
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.vertical,
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      context.read<HomeBloc>().add(HomeRemoveItem(id: data[index].id));
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 15,
                      top: 50 - scale * 25,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white),
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(
                          3,
                          2,
                          0.001,
                        )
                        ..rotateY(angle),
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(15, 25, 15, 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index].topic??"",
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(40)),
                                ),
                                Text(
                                  data[index].title??"",
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(30)),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                Text(
                                  data[index].description??"",
                                  style: TextStyle(fontSize: 25, color: Colors.grey),
                                ),
                              ],
                            )),
                            SizedBox(
                              height: getProportionateScreenHeight(30),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.lightBlue,
                                    size: 40,
                                  ),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(5),
                                    primary: Colors.blue.shade50,
                                    shadowColor: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: state.tasks.length,
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
