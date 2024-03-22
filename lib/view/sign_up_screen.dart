import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanderlog/util/colors.dart';
import 'package:wanderlog/view/widgets/button.dart';
import 'package:wanderlog/util/style.dart';
import 'package:wanderlog/view/widgets/app_logo.dart';
import 'package:provider/provider.dart';
import 'package:wanderlog/controller/auth_controller.dart';
import 'package:wanderlog/view/widgets/text_field.dart';





class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: APP_THEME_COLOR,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * .15,
            ),
            appSmallLogo(),
            SizedBox(
              height: height * .07,
            ),
            Text(
              "Sign Up Now",
              style: normalStyle(fontWeight: FontWeight.w700, fontsize: 34),
            ),
            Text(
              "Please fill the details and create account",
              style: normalStyle(fontWeight: FontWeight.w400, fontsize: 20),
            ),
            SizedBox(
                  height: height * .08,
                ),
                customeTextField(
                    height: height, width: width, hintText: "Email"),
                SizedBox(
                  height: height * .02,
                ),
                Consumer<AuthController>(builder: (context, controller, _) {
                  return customeTextField(
                    obscureText: controller.obscureText,
                    height: height,
                    width: width,
                    hintText: "Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.isTextVisible();
                      },
                      icon: Icon(controller.obscureText
                          ? Icons.remove_red_eye_sharp
                          : CupertinoIcons.eye_slash_fill),
                      color: GREY,
                    ),
                  );
                }),
                Align(
                  alignment: Alignment.bottomRight,
                  child: customeTextButton(
                      onPressed: () {},
                      text: "Forget Password?",
                      textColor: DARK_BLUE_COLOR),
                ),
                SizedBox(
                  height: height * .05,
                ),
                customeElevtedButton(
                    width: width,
                    height: height,
                    onPressed: () {},
                    text: "Sign In",
                    textColor: WHITE,
                    bgColor: DARK_BLUE_COLOR),
                SizedBox(
                  height: height * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: normalStyle(color: WHITE, fontsize: 18),
                    ),
                    customeTextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                        },
                        text: "Sign Up",
                        textColor: DARK_BLUE_COLOR),
                  ],
                ),
                SizedBox(
                  height: height * .05,
                ),


  
          ],
        ),
      ),
    );
  }
}
