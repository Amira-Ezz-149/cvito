
import 'package:flutter/material.dart';

class DrawHalfCircle extends StatelessWidget {
  const DrawHalfCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///white60
      backgroundColor:Colors.white,
      body: Column(
        children: [
          ClipPath(
            clipper: MyCliper(),
            child: Container(
              height: 200,
              decoration:  BoxDecoration(
                color:Colors.grey.withOpacity(.25),
              ),
              child: const Center(),
            ),
          )
        ],
      ),
    );
  }
}

class MyCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double offset = 100.0;
    var path = Path();
    path.lineTo(0, height-offset);
    path.quadraticBezierTo(width/2, height, width, height-offset);
    path.lineTo(size.width, 0);
    path.close();
    return path;


  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
