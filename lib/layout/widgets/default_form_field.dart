import 'package:cvito/constants/constants.dart';
import 'package:flutter/material.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required Function onChanged,
  final validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    SizedBox(
      height: 45.0,
      child: TextFormField(
        onChanged: (value) {
          onChanged(value);
        },
        controller: controller,
        keyboardType: type,
        enabled: isClickable,
        validator: validate,
        decoration: InputDecoration(
          isDense: false,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: kBasicColor),
              borderRadius: BorderRadius.circular(10)),
          labelText: label,
          filled: true,
          fillColor: Colors.grey.shade100,
          prefixIcon: Icon(prefix),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {
                    suffixPressed!();
                  },
                  icon: Icon(suffix),
                )
              : null,
          border: const OutlineInputBorder(),
        ),
      ),
    );
