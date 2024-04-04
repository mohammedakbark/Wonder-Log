import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wanderlog/util/colors.dart';
import 'package:wanderlog/view/edit_profile_page.dart';
import 'package:wanderlog/view/widgets/button.dart';

Container shimmerPlaceholder({double? height, double? width}) {
    return Container(
      color: WHITE,
      height: height,
      width: width,
    );
  }

  gap(double height) {
    return SizedBox(
      height: height * .01,
    );
  }

Widget shimmerEffectForProfile(double height, double width,bool isButtonVisible,context) {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    enabled: true,
    child: Row(
      children: [
        Container(
          height: height * .1,
          width: width * .25,
          decoration: const BoxDecoration(
              color: WHITE,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(40, 50),
                  bottomRight: Radius.elliptical(69, 90),
                  topRight: Radius.elliptical(60, 30),
                  bottomLeft: Radius.elliptical(60, 50))),
        ),
        SizedBox(
          width: width * .05,
        ),
        SizedBox(
          width: width * .6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmerPlaceholder(
                height: height * .03,
              ),
              gap(height),
              shimmerPlaceholder(height: height * .02, width: 200),
              gap(height),
              shimmerPlaceholder(
                height: height * .01,
              ),
              gap(height),
              shimmerPlaceholder(height: height * .01, width: 230),
              SizedBox(
                height: height * .02,
              ),
          isButtonVisible?    customeElevtedButton(
                width: width * .45,
                height: height * .7,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditProfilePage()));
                },
                text: "Edit profile",
                bgColor: LIGHT_BLUE_COLOR,
                textColor: WHITE,
              ):SizedBox()
            ],
          ),
        )
      ],
    ),
  );
}
