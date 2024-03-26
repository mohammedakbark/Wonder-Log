import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wanderlog/controller/controller.dart';
import 'package:wanderlog/util/colors.dart';
import 'package:wanderlog/util/snack_bar.dart';
import 'package:wanderlog/util/style.dart';

class AddNewRequestPage extends StatelessWidget {
  const AddNewRequestPage({super.key});

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
                    if (controller.placeBioController.text.isNotEmpty ||
                        controller.placeNameController.text.isNotEmpty) {
                      Navigator.of(context).pop();
                    } else {
                      errorSnackBar(
                          context, "Oops,enter the field and proceed");
                    }
                  },
                  child: Text(
                    "Request",
                    style: poppinStyle(color: BLACK, fontsize: 19),
                  ));
            })
          ],
          leading: const SizedBox()),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: height * .16,
                width: width * .7,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      size: 33,
                    ),
                    Text(
                      "Add Image",
                      style: nunitoStyle(),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * .1,
            ),
            Consumer<Controller>(builder: (context, controller, child) {
              return Column(
                children: [
                  TextFormField(
                    controller: controller.placeNameController,
                    decoration: InputDecoration(
                        hintText: "Place",
                        hintStyle: normalStyle(letterSpacing: 1),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(20)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  TextFormField(
                    maxLines: 10,
                    controller: controller.placeBioController,
                    decoration: InputDecoration(
                        hintText: "Bio",
                        hintStyle: normalStyle(letterSpacing: 1),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(20)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(20))),
                  )
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
