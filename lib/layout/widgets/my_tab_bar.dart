// import 'package:cvito/constants/constants.dart';
// import 'package:flutter/material.dart';
//
// class MyTabBar extends StatelessWidget {
//   const MyTabBar({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 0.0,
//           backgroundColor: Colors.transparent,
//           bottom: const TabBar(
//               physics: BouncingScrollPhysics(),
//               unselectedLabelColor: Colors.grey,
//               indicatorColor: kBasicColor,
//               labelColor: kBasicColor,
//               indicatorSize: TabBarIndicatorSize.label,
//               automaticIndicatorColorAdjustment: true,
//               tabs: [
//                 Tab(text: 'Home'),
//                 Tab(text: 'About'),
//                 Tab(text: 'Jobs'),
//               ]),
//         ),
//         body: const TabBarView(children: [
//           Center(child: Text('tab 1 context')),
//           Center(child: Text('tab 2 context')),
//           Center(child: Text('tab 3 context')),
//         ]),
//       ),
//     );
//   }
// }
