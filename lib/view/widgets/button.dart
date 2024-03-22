import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:wanderlog/util/colors.dart';

Widget customeElevtedButton(
    {required width,
    required height,
    Color? bgColor,
    Color? textColor,
    String? text,
    required void Function()? onPressed}) {
  return SizedBox(
      width: width,
      height: height * .06,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: bgColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Text(
            text!,
            style: TextStyle(color: textColor, fontSize: 18),
          )));
}

Widget customeTextButton(
    {Color? bgColor,
    Color? textColor,
    String? text,
    required void Function()? onPressed}) {
  return TextButton(
      onPressed: onPressed,
      child: Text(
        text!,
        style: TextStyle(color: textColor, fontSize: 18),
      ));
}
