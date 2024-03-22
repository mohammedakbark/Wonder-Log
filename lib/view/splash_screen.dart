import 'package:flutter/material.dart';
import 'package:wanderlog/util/colors.dart';
import 'package:wanderlog/view/statrt_screen.dart';
import 'package:wanderlog/view/widgets/app_logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const GetStartScreen(),
          ),
          (route) => false);
    });

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: APP_THEME_COLOR,
        body: SizedBox(width: width, child: appLogo()));
  }
}