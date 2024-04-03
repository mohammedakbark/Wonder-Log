import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wanderlog/controller/fire_controller.dart';
import 'package:wanderlog/util/colors.dart';
import 'package:wanderlog/util/style.dart';
import 'package:wanderlog/view/edit_profile_page.dart';
import 'package:wanderlog/view/widgets/button.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: TRANSPERENT,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
        child: Column(
          children: [
            Consumer<FireController>(builder: (context, fireController, _) {
              return FutureBuilder(
                  future: fireController.fetchCurrentUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        width: 200.0,
                        height: 100.0,
                        child: Shimmer.fromColors(
                          baseColor: Colors.red,
                          highlightColor: Colors.yellow,
                          child: Row(
                            children: [
                              Container(
                                height: height * .1,
                                width: width * .25,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            "https://s3-alpha-sig.figma.com/img/9002/a10e/92afc22c4fb716d785abc2f63fd808a6?Expires=1712534400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=YFsvQsggoNN5ZWRR1Zx6RRfJYru4m-B~bq3~3QTSR068ikBjwFLaiDi~OAVhM-qxEwQsaT9P2cjrVY~3ewqFDXqMijtpanjNprUiZUpVx5Bb7kIDgik8sQqg1TfoxAPl9JA~QAcD8Lc0HLVS74imRFFpFyS-5VPRwg8BUYNaRzZJtNO-g~oTTrvxjqB09rmstcpbuj3FSCwkLalhGlfHBXRaPcHQJUuP1a7vOXIlQBpqO~PFS-ok7zjtIbyG0S1k33E1cQF4Zc~6RIFR0TkgkaK9ICyICCsjed~FYqDyj06m1gUmO5xPSPRalVJR48e3NY0AY1jaBxDyoYJ5JTBGTQ__")),
                                    // color: DARK_BLUE_COLOR,
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
                                    Text(
                                      "Lakshmi Menon",
                                      style: poppinStyle(
                                          fontWeight: FontWeight.w600,
                                          fontsize: 25),
                                    ),
                                    Text(
                                      "Travel Vlogar",
                                      style: poppinStyle(
                                          fontWeight: FontWeight.w600,
                                          fontsize: 15),
                                    ),
                                    Text(
                                      "Adventuring through life, one mountain at a time ⛰️",
                                      // overflow: TextOverflow.ellipsis,
                                      style: poppinStyle(
                                        fontWeight: FontWeight.w500,
                                        fontsize: 12,
                                      ),
                                    ),
                                    Text(
                                      "Collecting memories, not things 🌄",
                                      // overflow: TextOverflow.ellipsis,
                                      style: poppinStyle(
                                        fontWeight: FontWeight.w500,
                                        fontsize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * .02,
                                    ),
                                    customeElevtedButton(
                                      width: width * .45,
                                      height: height * .7,
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProfilePage()));
                                      },
                                      text: "Edit profile",
                                      bgColor: LIGHT_BLUE_COLOR,
                                      textColor: WHITE,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    return Row(
                      children: [
                        Container(
                          height: height * .1,
                          width: width * .25,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      "https://s3-alpha-sig.figma.com/img/9002/a10e/92afc22c4fb716d785abc2f63fd808a6?Expires=1712534400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=YFsvQsggoNN5ZWRR1Zx6RRfJYru4m-B~bq3~3QTSR068ikBjwFLaiDi~OAVhM-qxEwQsaT9P2cjrVY~3ewqFDXqMijtpanjNprUiZUpVx5Bb7kIDgik8sQqg1TfoxAPl9JA~QAcD8Lc0HLVS74imRFFpFyS-5VPRwg8BUYNaRzZJtNO-g~oTTrvxjqB09rmstcpbuj3FSCwkLalhGlfHBXRaPcHQJUuP1a7vOXIlQBpqO~PFS-ok7zjtIbyG0S1k33E1cQF4Zc~6RIFR0TkgkaK9ICyICCsjed~FYqDyj06m1gUmO5xPSPRalVJR48e3NY0AY1jaBxDyoYJ5JTBGTQ__")),
                              // color: DARK_BLUE_COLOR,
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
                              Text(
                                "Lakshmi Menon",
                                style: poppinStyle(
                                    fontWeight: FontWeight.w600, fontsize: 25),
                              ),
                              Text(
                                "Travel Vlogar",
                                style: poppinStyle(
                                    fontWeight: FontWeight.w600, fontsize: 15),
                              ),
                              Text(
                                "Adventuring through life, one mountain at a time ⛰️",
                                // overflow: TextOverflow.ellipsis,
                                style: poppinStyle(
                                  fontWeight: FontWeight.w500,
                                  fontsize: 12,
                                ),
                              ),
                              Text(
                                "Collecting memories, not things 🌄",
                                // overflow: TextOverflow.ellipsis,
                                style: poppinStyle(
                                  fontWeight: FontWeight.w500,
                                  fontsize: 12,
                                ),
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              customeElevtedButton(
                                width: width * .45,
                                height: height * .7,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => EditProfilePage()));
                                },
                                text: "Edit profile",
                                bgColor: LIGHT_BLUE_COLOR,
                                textColor: WHITE,
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  });
            }),
            SizedBox(
              height: height * .02,
            ),
            Expanded(
                child: GridView.builder(
              itemCount: 10,
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  QuiltedGridTile(2, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),

                  // QuiltedGridTile(2, 2),
                  // QuiltedGridTile(2, 2),
                ],
              ),
              itemBuilder: (context, index) {
                return Card();
              },
              // childrenDelegate: SliverChildBuilderDelegate(
              //   (context, index) => Container(
              //     color: Colors.red,
              //     child: Center(child: Text(index.toString())),
              //   ),
              // ),
            ))
          ],
        ),
      ),
      // body: Shimmer.fromColors(
      //     baseColor: Colors.grey.shade300,
      //     highlightColor: Colors.grey.shade100,
      //     enabled: true,
      //     child: SingleChildScrollView(
      //       physics: NeverScrollableScrollPhysics(),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         mainAxisSize: MainAxisSize.max,
      //         children: [

      //         ],
      //       ),
      //     )),
    );
  }
}
