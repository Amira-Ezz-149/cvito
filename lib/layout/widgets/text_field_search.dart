import 'package:flutter/material.dart';
Widget textFormField({
  String? hint,
  Function? onSaved,
  Key? key,
  String? label,
  TextStyle? hintstyle,
  TextStyle? labelStyle,
  required double? radious,
  SizedBox? suffix,
  Function? suffixPressed,
  bool isClickable = true,
  TextEditingController? controller,
  required TextInputType type,
  Function? onChanged,
  final validate,
  Color? color,
  bool obscureText = false,
  int? maxline,
}) {

  return SizedBox(
    width: 285,
      height: 50,
      child: TextFormField(
        obscureText: obscureText,
        onSaved:(value) {
          onSaved!(value);
        },
        key: key,
        controller: controller,
        keyboardType: type,
        maxLines: maxline,
        minLines: 1,
        validator: validate,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 15,left: 15),
          hintText: hint,
          isDense: false,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.transparent),
              borderRadius: BorderRadius.circular(radious!)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.transparent),
              borderRadius: BorderRadius.circular(radious)),
          labelStyle: labelStyle,
          hintStyle: hintstyle,
          filled: true,
          fillColor: color,
          suffixIcon: suffix,
          labelText: label,
        ),
      ),
    );
}