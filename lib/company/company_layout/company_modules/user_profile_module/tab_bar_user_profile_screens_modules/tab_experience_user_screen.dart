import 'package:cvito/some_helpers/constants/time_line_class.dart';
import 'package:cvito/some_helpers/cubit/cubit.dart';
import 'package:cvito/some_helpers/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabExperienceUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CVCubit(),
      child: BlocConsumer<CVCubit, CVStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = CVCubit();
          return Scaffold(
              body: TimelineComponent(
            timelineList: cubit.userExperienceList,
            backgroundColor: Colors.white,
            // headingColor: Colors.green,
          ));
        },
      ),
    );
  }
}

class TimelineComponent extends StatefulWidget {
  final List<TimelineModel> timelineList;

  final Color backgroundColor;

  // final Color headingColor;

  TimelineComponent({
    required this.timelineList,
    required this.backgroundColor,
    // required this.headingColor,
  });

  @override
  TimelineComponentState createState() {
    return TimelineComponentState();
  }
}

class TimelineComponentState extends State<TimelineComponent>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;
  double fraction = 0.0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    controller?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.timelineList.length,
        itemBuilder: (_, index) {
          return TimelineElement(
              lineColor: widget.timelineList[index].lineColor ,
              backgroundColor: widget.backgroundColor,
              model: widget.timelineList[index],
              firstElement: index == 0,
              lastElement: widget.timelineList.length == index + 1,
              controller: controller!,
              // headingColor: widget.timelineList[index].titleColor,
              // descriptionColor: widget.timelineList[index].descriptionColor

          );
        });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}