import 'package:flutter/material.dart';

///here is the most methods we will use many times

///navigator method
void navigateTo({required context, required widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

