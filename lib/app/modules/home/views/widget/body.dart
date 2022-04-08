import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/home/controllers/home_controller.dart';
import 'package:gapoktan_app/app/modules/home/views/widget/carousel_widget.dart';
import 'package:gapoktan_app/app/modules/home/views/widget/constants.dart';
import 'package:gapoktan_app/app/modules/home/views/widget/item_menu_view.dart';
import 'package:get/get.dart';

import 'featurred_plants.dart';
import 'header_with_seachbox.dart';
import 'recomend_plants.dart';
import 'title_with_more_bbtn.dart';

class Body extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Menu", press: () {}),
          // RecomendsPlants(),
          // ItemMenuView(),
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
          TitleWithMoreBtn(title: "Title", press: () {}),
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
