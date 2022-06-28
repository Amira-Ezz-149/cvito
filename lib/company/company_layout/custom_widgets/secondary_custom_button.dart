import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:flutter/material.dart';

/// for company button
class SecondaryCustomButton extends StatelessWidget {
  const SecondaryCustomButton({
    @required this.text,
    @required this.function,
  });

  final String? text;
  final VoidCallback? function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text!),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        onPrimary: kBasicColor,
        primary: Colors.white,
        onSurface: Colors.grey,
        side: const BorderSide(color: kBasicColor, width: 1),

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: function,
    );
  }
}
// }
// FittedBox(
// child: Container(
// alignment: Alignment.center,
// decoration: BoxDecoration(
// border: Border.all(color: kBasicColor),
// color: Colors.white,
// borderRadius: BorderRadius.circular(50.0),
// ),
// child: Padding(
// padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
// child: Text(
// text!,
// style: const TextStyle(
// color: kBasicColor,
// fontWeight: FontWeight.w600,
// fontSize: 15,
// ),
// ),
// ),
// ),
// ),