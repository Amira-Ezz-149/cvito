import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String? imageLink;
  VoidCallback? function;
   CustomCard({required this.imageLink, this.function});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: function,
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 3.5,
          decoration: BoxDecoration(
            // color: kBasicColor,
            borderRadius: BorderRadius.circular(25.0),
            // color: Colors.red,
            image: DecorationImage(
              // fit: BoxFit.fill,
              image: AssetImage(
                imageLink!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
