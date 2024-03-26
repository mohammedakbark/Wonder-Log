import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wanderlog/controller/controller.dart';
import 'package:wanderlog/util/colors.dart';
import 'package:wanderlog/util/style.dart';
import 'package:wanderlog/view/widgets/button.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: TRANSPERENT,
        leading: SizedBox(),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Done",
                style: poppinStyle(color: BLACK, fontsize: 19),
              ))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      alignment: Alignment.bottomRight,
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
                      child: InkWell(onTap: () {}, child: Icon(Icons.add))),
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
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * .09,
              ),
              Consumer<Controller>(builder: (context, controller, child) {
                return Column(
                  children: [
                    TextFormField(
                      controller: controller.editiNameController,
                      decoration: InputDecoration(
                          hintText: "Name",
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
                      maxLines: 5,
                      controller: controller.editiBioController,
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
          )),
    );
  }
}
