
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:wanderlog/controller/controller.dart';
import 'package:wanderlog/util/colors.dart';
import 'package:wanderlog/util/snack_bar.dart';
import 'package:wanderlog/util/style.dart';
import 'package:wanderlog/view/about.dart';
import 'package:wanderlog/view/new_request_page.dart';
import 'package:wanderlog/view/notification.dart';
import 'package:wanderlog/view/profile.dart';
import 'package:wanderlog/view/single_item_page.dart';
import 'package:wanderlog/view/widgets/button.dart';
import 'package:wanderlog/view/privacy.dart';
import 'package:wanderlog/view/widgets/rating_bar.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});
  int starLength = 4;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        drawer: Drawer(
            backgroundColor: TRANSPERENT,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * .15,
                ),
                Container(
                  height: height * .4,
                  padding: const EdgeInsets.only(left: 30),
                  width: width * .5,
                  decoration: const BoxDecoration(
                      color: DARK_BLUE_COLOR,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(40, 70),
                          bottomRight: Radius.elliptical(200, 60),
                          topRight: Radius.elliptical(80, 20),
                          bottomLeft: Radius.elliptical(10, 0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      drawerButton(
                          title: "Profile",
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ProfileTab(),
                            ));
                          }),
                      drawerButton(
                          title: "Notification",
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const NotificationTab(),
                            ));
                          }),
                      drawerButton(
                          title: "About",
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const About(),
                            ));
                          }),
                      drawerButton(
                          title: "Privacy",
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Privacy(),
                            ));
                          }),
                      drawerButton(
                          title: "Log out",
                          onPressed: () {
                            showLoadingIndicator(context);
                            // FirebaseAuth.instance.signOut().then((value) {
                            //   exit(0);
                            // });
                          }),
                    ],
                  ),
                )
              ],
            )),
        body: CustomScrollView(slivers: [
          SliverAppBar(
            toolbarHeight: height * .15,
            leading: Builder(builder: (context) {
              return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.sort_sharp,
                    size: 33,
                  ));
            }),
            actions: [
              navButton(
                  icon: Icons.add,
                  hight: 50,
                  width: 50,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddNewRequestPage(),
                    ));
                  }),
              const SizedBox(
                width: 10,
              ),
            ],
            title: Consumer<Controller>(builder: (context, controller, _) {
              return TextFormField(
                controller: controller.serchController,
                decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.search_rounded,
                      color: GREY,
                    ),
                    filled: true,
                    fillColor: REDISH_GREY,
                    hintText: "Search your",
                    hintStyle: normalStyle(letterSpacing: 1, color: GREY),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              );
            }),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(height * .1),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rating",
                      style: nunitoStyle(
                          color: BLACK,
                          fontsize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: GREY.withOpacity(.1),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 0))
                      ], color: WHITE, borderRadius: BorderRadius.circular(20)),
                      width: width,
                      height: height * .12,
                      child: Row(
                        children: [
                          Container(
                            height: height * .1,
                            width: 100,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          SizedBox(
                            height: height * .1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bajra Sandhi Monumnet",
                                  style: nunitoStyle(
                                      fontWeight: FontWeight.bold,
                                      fontsize: 17),
                                ),
                                SizedBox(
                                  height: height * .005,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_pin,
                                      color: GREY,
                                      size: 18,
                                    ),
                                    Text(
                                      "Panjeri, South Denpas",
                                      style: nunitoStyle(
                                        fontWeight: FontWeight.bold,
                                        fontsize: 15,
                                        color: GREY,
                                      ),
                                    )
                                  ],
                                ),
                                const Expanded(child: SizedBox()),
                                Row(
                                  children: [
                                    Text(
                                      "3.3 KM",
                                      style: nunitoStyle(
                                        fontWeight: FontWeight.bold,
                                        fontsize: 16,
                                        color: GREY,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    constRatingBar(starLength.toDouble())
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SingleItemPage(),
                                ));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: APP_THEME_COLOR,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7))),
                              child: Text(
                                "More",
                                style: nunitoStyle(
                                    fontWeight: FontWeight.bold, color: WHITE),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFillViewport(
              padEnds: false,
              viewportFraction: .04,
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: Text(
                    "Recent",
                    style: nunitoStyle(
                        color: BLACK,
                        fontsize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ])),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        padding: const EdgeInsets.only(right: 10, top: 10),
                        width: width,
                        height: height * .27,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 30,
                            ),
                            Text(
                              "Lakshmi",
                              style: nunitoStyle(
                                  fontsize: 12, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rome,Italy",
                            style: poppinStyle(
                                fontWeight: FontWeight.w500, fontsize: 26),
                          ),
                          constRatingBar(4, itemSize: 12)
                        ],
                      ),
                      const Text(
                          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit,sed diam nonummy nibh euismod tincidunt ut laoreetdolore magna aliquam erat volutpat. Ut wisi enimad minim veniam,  "),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: navButton(
                              iconSize: 10,
                              icon: Icons.arrow_forward_ios,
                              hight: 20,
                              width: 20,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SingleItemPage(),
                                ));
                              })),
                    ],
                  ),
                );
              }
            },
            childCount: 10,
          ))
        ]));
  }
}

Widget drawerButton(
    {required String title, required void Function()? onPressed}) {
  return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: normalStyle(
            color: WHITE, fontWeight: FontWeight.w600, fontsize: 16),
      ));
}
