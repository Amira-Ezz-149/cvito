import 'package:flutter/material.dart';

showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    title: const Text(
      "Somethings Went Wrong",
      style: TextStyle(color: Color(0xff1C1B1F), fontSize: 20),
    ),
    content: const Text(
        "It looks like your email or password is wrong. Please be sure of them and try again",
        style: TextStyle(color: Color(0xff49454F), fontSize: 14)),
    actions: [
      okButton,
    ],
  );
  showDialog(
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
