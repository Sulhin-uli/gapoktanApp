import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gapoktan_app/app/modules/home/controllers/home_controller.dart';
import 'package:gapoktan_app/app/modules/home/views/widget/body.dart';
import 'package:gapoktan_app/app/modules/home/views/widget/constants.dart';
import 'package:gapoktan_app/app/modules/home/views/widget/my_bottom_nav_bar.dart';
import 'package:get/get.dart';

class IndexHomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
    );
  }
}
