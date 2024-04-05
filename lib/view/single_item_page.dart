import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wanderlog/controller/controller.dart';
import 'package:wanderlog/controller/fire_controller.dart';
import 'package:wanderlog/model/review_model.dart';
import 'package:wanderlog/util/colors.dart';
import 'package:wanderlog/util/snack_bar.dart';
import 'package:wanderlog/util/style.dart';
import 'package:wanderlog/view/selected_profile_detail.dart';
import 'package:wanderlog/view/widgets/button.dart';
import 'package:wanderlog/view/widgets/rating_bar.dart';
import 'package:wanderlog/view/widgets/shimmer_effect.dart';

class SingleItemPage extends StatelessWidget {
  String url;
  String uid;
  // String profile;
  String postId;
  // String userName;
  String title;
  String subtitle;

  SingleItemPage(
      {super.key,
      required this.postId,
      required this.subtitle,
      required this.title,
      required this.url,
      required this.uid});
  String time = DateFormat('h:mm a').format(DateTime.now());
  String date = DateFormat("dd-mm-yy EEEE").format(DateTime.now());
  var commentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
        child: ListView(
          children: [
            SizedBox(
              height: height * .02,
            ),
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(right: 10, top: 10),
              width: width,
              height: height * .27,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(url)),
                  color: GREY.shade300,
                  borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SelectedProfileDetail(),
                  ));
                },
                child: Consumer<FireController>(
                    builder: (context, fireController, _) {
                  return FutureBuilder(
                      future: fireController.fechSelectedUserData(uid),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          shimmerEffect(
                            child: const CircleAvatar(
                              backgroundColor: WHITE,
                              radius: 30,
                            ),
                          );
                        }
                        final user = fireController.selecteduserData;
                        return Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: WHITE,
                              radius: 30,
                              backgroundImage: NetworkImage(user!.imageUrl),
                            ),
                            Text(
                              user.name,
                              style: nunitoStyle(
                                  fontsize: 12, fontWeight: FontWeight.w600),
                            )
                          ],
                        );
                      });
                }),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: poppinStyle(fontWeight: FontWeight.w500, fontsize: 26),
                ),
                Consumer<FireController>(
                    builder: (context, fircontroller, child) {
                  return FutureBuilder(
                      future: fircontroller.fetchSelectedPostRating(postId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return shimmerEffect(
                              child: constRatingBar(4, itemSize: 18));
                        }
                        return InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => Form(
                                      key: _formKey,
                                      child: AlertDialog(
                                        elevation: 0,
                                        shape:
                                            const ContinuousRectangleBorder(),
                                        backgroundColor: WHITE,
                                        title: Text(
                                          "Review & feedback",
                                          style: nunitoStyle(
                                              fontsize: 22,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        content: SizedBox(
                                          height: height * .3,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                height: height * .01,
                                              ),
                                              TextFormField(
                                                textCapitalization:
                                                    TextCapitalization
                                                        .sentences,
                                                controller: commentController,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Drop your comment";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                maxLines: 5,
                                                decoration: InputDecoration(
                                                    hintText: "Comment...",
                                                    hintStyle: nunitoStyle(),
                                                    focusedBorder:
                                                        const OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color:
                                                                        BLACK)),
                                                    border:
                                                        const OutlineInputBorder()),
                                              ),
                                              Consumer<Controller>(builder:
                                                  (context, controller, child) {
                                                return RatingBar.builder(
                                                    maxRating: 5,
                                                    minRating: 1,
                                                    updateOnDrag: true,
                                                    initialRating:
                                                        controller.rating,
                                                    ignoreGestures: false,

                                                    // glow: true,
                                                    unratedColor: BLACK,
                                                    glowColor: YELLOW,
                                                    itemSize: 40,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return const Icon(
                                                        Icons.star,
                                                        color: YELLOW,
                                                      );
                                                    },
                                                    // tapOnlyMode: true,
                                                    onRatingUpdate: (value) {
                                                      print(value);
                                                      controller
                                                          .updaterating(value);
                                                    });
                                              }),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          Consumer<Controller>(builder:
                                              (context, controller, child) {
                                            return customeElevtedButton(
                                                width: width,
                                                height: height,
                                                onPressed: () {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    fircontroller
                                                        .addNewReview(
                                                            postId,
                                                            ReviewModel(
                                                                date: date,
                                                                postId: postId,
                                                                rating:
                                                                    controller
                                                                        .rating,
                                                                review:
                                                                    commentController
                                                                        .text,
                                                                time: time,
                                                                uid: FirebaseAuth
                                                                    .instance
                                                                    .currentUser!
                                                                    .uid))
                                                        .then((value) {
                                                      Navigator.of(context)
                                                          .pop();
                                                      successSnackBar(context,
                                                          "Thank you for your feedback");
                                                    });
                                                  }
                                                },
                                                bgColor: DARK_BLUE_COLOR,
                                                textColor: WHITE,
                                                text: "Submit");
                                          })
                                        ],
                                      ),
                                    ));
                          },
                          child: constRatingBar(fircontroller.rating,
                              itemSize: 18),
                        );
                      });
                })
              ],
            ),
            SizedBox(
              height: height * .02,
            ),
            Text(subtitle)
          ],
        ),
      ),
    );
  }
}
