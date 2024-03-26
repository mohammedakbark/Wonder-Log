import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wanderlog/util/colors.dart';
import 'package:wanderlog/util/style.dart';
import 'package:wanderlog/view/widgets/button.dart';

class NotificationTab extends StatelessWidget {
  const NotificationTab({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(

      appBar: AppBar(
         surfaceTintColor: TRANSPERENT,
        centerTitle: true,
        title: Text(
          "Notification",
          style: normalStyle(fontsize: 27, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
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
                title: Text(
                  "Someone commented on your post: Around Heavy ball floor these languag....",
                  style: normalStyle(color: GREY, fontsize: 19),
                ),
                trailing: Text(
                  "9:45 AM",
                  style: normalStyle(color: GREY, fontsize: 19),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(
                  endIndent: 20,
                  indent: 20,
                ),
            itemCount: 10),
      ),
    );
  }
}
