import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/home/Models/menu_home_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;
  var menu_home = List<MenuHome>.empty().obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void getData() {
    final data = MenuHome(
      id: "1",
      image:
          "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
      title: "Menu 1",
      color: Colors.red,
    );
    menu_home.add(data);
  }

  List<MenuHome> getMenuHome() {
    return [
      MenuHome(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Menu 1",
        color: Colors.red,
      ),
      MenuHome(
          image:
              "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
          title: "Menu 2",
          color: Colors.yellow),
      MenuHome(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Menu 3",
        color: Colors.green,
      ),
      MenuHome(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Menu 4",
        color: Colors.purple,
      ),
      MenuHome(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Menu 5",
        color: Colors.cyan,
      ),
      MenuHome(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Menu 6",
        color: Colors.lightBlue,
      ),
      MenuHome(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Menu 7",
        color: Colors.pinkAccent,
      ),
      MenuHome(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Menu 8",
        color: Colors.pinkAccent,
      ),
      MenuHome(
        image:
            "https://cdn2.iconfinder.com/data/icons/maps-navigation-linear-black/614/3683_-_Marker_I-512.png",
        title: "Menu 9",
        color: Colors.pinkAccent,
      ),
    ];
  }

  @override
  void onInit() {
    getData();
    getMenuHome();
    super.onInit();
  }
}
