import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanderlog/controller/controller.dart';
import 'package:wanderlog/controller/fire_controller.dart';
import 'package:wanderlog/util/colors.dart';
import 'package:wanderlog/view/navigation_bar.dart';
import 'package:wanderlog/view/statrt_screen.dart';
import 'package:wanderlog/view/widgets/app_logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (FirebaseAuth.instance.currentUser == null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => GetStartScreen(),
            ),
            (route) => false);
      } else {
        Provider.of<FireController>(context, listen: false)
            .fetchSelectedPostRating(FirebaseAuth.instance.currentUser!.uid);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => Navigation(),
            ),
            (route) => false);
      }
    });

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: APP_THEME_COLOR,
        body: SizedBox(width: width, child: appLogo()));
  }
}
