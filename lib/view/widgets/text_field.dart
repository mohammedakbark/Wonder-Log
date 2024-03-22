import 'package:flutter/material.dart';
import 'package:wanderlog/util/colors.dart';
import 'package:wanderlog/util/style.dart';

Widget customeTextField(
    {required width,
    required height,
    required String hintText,
    bool obscureText = false,
    Widget? suffixIcon,
    TextEditingController? controller}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: normalStyle(letterSpacing: 1),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(13))),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(13))),
        fillColor: WHITE,
        filled: true),
  );
}
