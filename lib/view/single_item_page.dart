import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanderlog/util/style.dart';
import 'package:wanderlog/view/selected_profile_detail.dart';
import 'package:wanderlog/view/widgets/rating_bar.dart';

class SingleItemPage extends StatelessWidget {
  const SingleItemPage({super.key});

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
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SelectedProfileDetail(),
                  ));
                },
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
            ),
            SizedBox(
              height: height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rome,Italy",
                  style: poppinStyle(fontWeight: FontWeight.w500, fontsize: 26),
                ),
                constRatingBar(4, itemSize: 18)
              ],
            ),
            SizedBox(
              height: height * .02,
            ),
            const Text(
                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit,sed diam nonummy nibh euismod tincidunt ut laoreetdolore magna aliquam erat volutpat. Ut wisi enimad minim veniam,  "),
          ],
        ),
      ),
    );
  }
}
