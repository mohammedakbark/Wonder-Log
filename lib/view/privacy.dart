import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanderlog/controller/controller.dart';
import 'package:wanderlog/util/colors.dart';
import 'package:wanderlog/util/snack_bar.dart';
import 'package:wanderlog/util/style.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * .1,
        leadingWidth: 70,
        centerTitle: true,
        actions: [
          Consumer<Controller>(builder: (context, controller, child) {
            return TextButton(
                onPressed: () {
                  if (controller.emailController.text.isNotEmpty) {
                    Navigator.of(context).pop();
                  } else {
                    errorSnackBar(context, "Oops,enter the email and proceed");
                  }
                },
                child: Text(
                  "Reset",
                  style: poppinStyle(color: BLACK, fontsize: 19),
                ));
          })
        ],
        title: Text(
          "Privacy",
          style: normalStyle(fontsize: 27, fontWeight: FontWeight.w500),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: GREY.withOpacity(.6),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(0, 2))
                  ],
                  color: WHITE,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: BLACK,
                )),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * .1,
            ),
            Text(
              "Reset Password",
              style: poppinStyle(),
            ),
            SizedBox(
              height: height * .02,
            ),
            Consumer<Controller>(builder: (context, controller, _) {
              return TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: normalStyle(letterSpacing: 1),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(20)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(20))),
              );
            }),
          ],
        ),
      ),
    );
  }
}
