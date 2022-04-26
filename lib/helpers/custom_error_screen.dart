import 'package:cvito/constants/constants.dart';
import 'package:flutter/material.dart';

customErrorScreen() {
  return ErrorWidget.builder = ((details) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/error_image.png'),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(details.exception.toString(),
                style: const TextStyle(color: kBasicColor,), textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  });
}
