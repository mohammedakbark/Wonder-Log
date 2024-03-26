import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wanderlog/controller/controller.dart';
import 'package:wanderlog/util/colors.dart';
import 'package:wanderlog/util/style.dart';
import 'package:wanderlog/view/single_item_page.dart';
import 'package:wanderlog/view/widgets/button.dart';
import 'package:wanderlog/view/widgets/rating_bar.dart';

class LocationTab extends StatelessWidget {
  const LocationTab({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: TRANSPERENT,
        centerTitle: true,
        title: Text(
          "Location",
          style: normalStyle(fontsize: 27, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
        child: Column(children: [
          Consumer<Controller>(builder: (context, controller, _) {
            return TextFormField(
              controller: controller.serchController,
              decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.search_rounded,
                    color: GREY,
                  ),
                  // filled: true,
                  // fillColor: REDISH_GREY,
                  hintText: "Search your",
                  hintStyle: normalStyle(letterSpacing: 1, color: GREY),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            );
          }),
          SizedBox(
            height: height * .02,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: width,
                    height: height * .12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          // height: height * .1,
                          width: width * .6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rome,Italy",
                                style: nunitoStyle(
                                    fontWeight: FontWeight.bold, fontsize: 25),
                              ),
                              SizedBox(
                                height: height * .005,
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet, consecte sed diam nonummy nibh euismod tin dolore magna aliquam erat v",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: nunitoStyle(
                                  fontWeight: FontWeight.bold,
                                  fontsize: 15,
                                  color: GREY,
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  constRatingBar(2, itemSize: 13),
                                  navButton(
                                      icon: Icons.arrow_forward_ios_sharp,
                                      hight: 20,
                                      width: 20,
                                      iconSize: 10,
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              const SingleItemPage(),
                                        ));
                                      })
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: height * .02,
                    ),
                itemCount: 10),
          ),
        ]),
      ),
    );
  }
}
