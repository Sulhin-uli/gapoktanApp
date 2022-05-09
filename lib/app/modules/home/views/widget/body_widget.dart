import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/home/controllers/home_controller.dart';
import 'package:gapoktan_app/app/modules/home/views/widget/carousel_widget.dart';
import 'package:gapoktan_app/app/utils/constant.dart';
import 'package:gapoktan_app/app/modules/home/views/widget/item_menu_widget.dart';
import 'package:get/get.dart';

import 'header_widget.dart';

class Body extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header(size: size),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text(
              "Menu",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 220,
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: controller.menu_home.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.25),
              itemBuilder: (context, index) {
                final data = controller.menu_home[index];
                return ItemMenuView(data);
              },
            ),
          ),
          // TitleWithMoreBtn(title: "Title", press: () {}),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text(
              "Title",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Carousel(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
