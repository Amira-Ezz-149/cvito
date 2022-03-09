import 'package:flutter/material.dart';
///here is the most methods we will use many times

///navigator method
void navigateTo({required context, required widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

// Future openLink({
//   required String url,
// }) =>
//     _launcher(url);
//
// Future _launcher(String url) async {
//   if (await canLaunch(url)) {
//     await launch(url);
//   }
// }

///=====================================================================
///=====================================================================
// Future openEmail({
//   required String toEmail,
//   required String subject,
//   required String body,
// }) async {
//   final url = 'mailto:$toEmail';
//
//   await _launcher(url);
// }
