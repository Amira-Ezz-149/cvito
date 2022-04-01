// import 'package:cvito/constants/sized_config.dart';
// import 'package:cvito/cubit/cubit.dart';
// import 'package:cvito/cubit/states.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class TabEducationUserScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CVCubit(),
//       child: BlocConsumer<CVCubit, CVStates>(
//         listener: (BuildContext context, state) {},
//         builder: (BuildContext context, state) {
//           var cubit = CVCubit();
//           return Scaffold(
//               body: TimelineComponent(
//                 timelineList: cubit.userEducationList,
//                 backgroundColor: Colors.white,
//                 // headingColor: Colors.green,
//               ));
//         },
//       ),
//     );
//   }
// }
//
// class TimelineComponent extends StatefulWidget {
//   final List<TimelineModel> timelineList;
//
//   final Color backgroundColor;
//
//   // final Color headingColor;
//
//   TimelineComponent({
//     required this.timelineList,
//     required this.backgroundColor,
//     // required this.headingColor,
//   });
//
//   @override
//   TimelineComponentState createState() {
//     return TimelineComponentState();
//   }
// }
//
// class TimelineComponentState extends State<TimelineComponent>
//     with SingleTickerProviderStateMixin {
//   Animation<double>? animation;
//   AnimationController? controller;
//   double fraction = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//         duration: const Duration(milliseconds: 1000), vsync: this);
//     controller?.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: widget.timelineList.length,
//         itemBuilder: (_, index) {
//           return TimelineElement(
//             lineColor: widget.timelineList[index].lineColor ??
//                 Theme.of(context).accentColor,
//             backgroundColor: widget.backgroundColor ?? Colors.white,
//             model: widget.timelineList[index],
//             firstElement: index == 0,
//             lastElement: widget.timelineList.length == index + 1,
//             controller: controller!,
//             // headingColor: widget.timelineList[index].titleColor,
//             // descriptionColor: widget.timelineList[index].descriptionColor
//
//           );
//         });
//   }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
//
// ///======================================================================================
// /// TimelineModel
// class TimelineModel {
//   final String id;
//   final String title;
//   final String hh;
//   final String description;
//   final String location;
//   final Color lineColor;
//   // final Color descriptionColor;
//   final Color titleColor;
//
//   const TimelineModel(
//       {required this.id,
//         required this.description,
//         required this.location,
//         required this.title,
//         required this.hh,
//         required this.lineColor,
//         // required this.descriptionColor,
//         required this.titleColor
//
//       });
// }
//
// ///=====================================================================================
// ///TimelineElement class
// class TimelineElement extends StatelessWidget {
//   final Color lineColor;
//   final Color backgroundColor;
//   final TimelineModel model;
//   final bool firstElement;
//   final bool lastElement;
//   final Animation<double> controller;
//   // final Color headingColor;
//   // final Color descriptionColor;
//
//   TimelineElement(
//       {required this.lineColor,
//         required this.backgroundColor,
//         required this.model,
//         this.firstElement = false,
//         this.lastElement = false,
//         required this.controller,
//         // required this.headingColor,
//         // required this.descriptionColor
//       });
//
//   Widget _buildLine() {
//     return SizedBox(
//         width: 40.0,
//         child: CustomPaint(
//             painter: TimelinePainter(
//                 lineColor: lineColor,
//                 backgroundColor: backgroundColor,
//                 firstElement: firstElement,
//                 lastElement: lastElement,
//                 controller: controller)));
//   }
//
//   Widget _buildContentColumn(BuildContext context) {
//     return Column(
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Container(
//               padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
//               child: Text(
//                   model.title.length > 47
//                       ? model.title.substring(0, 47) + "..."
//                       : model.title,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     // color: headingColor ?? Colors.black
//
//                   ))),
//           Expanded(
//               child: Text(
//                   model.description != null
//                       ? (model.description.length > 50
//                       ? model.description.substring(0, 50) + "..."
//                       : model.description)
//                       : "",
//                   // To prevent overflowing of text to the next element, the text is truncated if greater than 75 characters
//                   style: const TextStyle(
//                     // color: descriptionColor?? Colors.grey
//                   ))),
//
//           Expanded(
//               child: Text(
//                   model.hh != null
//                       ? (model.hh.length > 50
//                       ? model.hh.substring(0, 50) + "..."
//                       : model.hh)
//                       : "",
//                   // To prevent overflowing of text to the next element, the text is truncated if greater than 75 characters
//                   style: const TextStyle( color: Colors.grey
//                     // color: descriptionColor?? Colors.grey
//                   ))),
//
//           Expanded(
//               child: Text(
//                   model.location != null
//                       ? (model.location.length > 50
//                       ? model.location.substring(0, 50) + "..."
//                       : model.location)
//                       : "",
//                   // To prevent overflowing of text to the next element, the text is truncated if greater than 75 characters
//                   style: const TextStyle( color: Colors.grey
//                     // color: descriptionColor?? Colors.grey
//                   ))),
//
//
//
//         ]);
//   }
//
//   Widget _buildRow(BuildContext context) {
//     return Container(
//         height: getProportionateScreenHeight(130),
//         color: Colors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
//         child: Row(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               AnimatedBuilder(
//                   builder: (BuildContext context, widget) => _buildLine(),
//                   animation: controller),
//               Expanded(child: _buildContentColumn(context))
//             ]));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _buildRow(context);
//   }
// }
//
// ///====================================================================================
// ///TimelinePainter class
// class TimelinePainter extends CustomPainter {
//   final Color lineColor;
//   final Color backgroundColor;
//   final bool firstElement;
//   final bool lastElement;
//   final Animation<double> controller;
//   final Animation<double> height;
//
//   TimelinePainter(
//       {
//         required this.lineColor,
//         required this.backgroundColor,
//         this.firstElement = false,
//         this.lastElement = false,
//         required this.controller})
//       : height = Tween(begin: 0.0, end: 1.0).animate(
//     CurvedAnimation(
//       parent: controller,
//       curve: const Interval(0.45, 1.0, curve: Curves.ease),
//     ),
//   ),
//         super(repaint: controller);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     _centerElementPaint(canvas, size);
//   }
//
//   void _centerElementPaint(Canvas canvas, Size size) {
//     Paint lineStroke = Paint()
//       ..color = lineColor
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = 2.0
//       ..style = PaintingStyle.stroke;
//     if (firstElement && lastElement) {
//       // Do nothing
//     } else if (firstElement) {
//       Offset offsetCenter = size.center(const Offset(0.0, -4.0));
//       Offset offsetBottom = size.bottomCenter(const Offset(0.0, 0.0));
//       Offset renderOffset = Offset(
//           offsetBottom.dx, offsetBottom.dy * (0.5 + (controller.value / 2)));
//       canvas.drawLine(offsetCenter, renderOffset, lineStroke);
//     } else if (lastElement) {
//       Offset offsetTopCenter = size.topCenter(const Offset(0.0, 0.0));
//       Offset offsetCenter = size.center(const Offset(0.0, -4.0));
//       Offset renderOffset =
//       Offset(offsetCenter.dx, offsetCenter.dy * controller.value);
//       canvas.drawLine(offsetTopCenter, renderOffset, lineStroke);
//     } else {
//       Offset offsetTopCenter = size.topCenter(const Offset(0.0, 0.0));
//       Offset offsetBottom = size.bottomCenter(const Offset(0.0, 0.0));
//       Offset renderOffset =
//       Offset(offsetBottom.dx, offsetBottom.dy * controller.value);
//       canvas.drawLine(offsetTopCenter, renderOffset, lineStroke);
//     }
//
//     Paint circleFill = Paint()
//       ..color = lineColor
//       ..style = PaintingStyle.fill;
//
//     canvas.drawCircle(size.center(const Offset(0.0, -8.0)), 6.0, circleFill);
//   }
//
//   @override
//   bool shouldRepaint(TimelinePainter oldDelegate) {
//     return oldDelegate.lineColor != lineColor ||
//         oldDelegate.backgroundColor != backgroundColor;
//   }
// }
