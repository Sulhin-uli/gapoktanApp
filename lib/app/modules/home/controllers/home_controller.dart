import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/home/Models/menu_home_model.dart';
import 'package:gapoktan_app/app/modules/login/controllers/login_controller.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;
  var menu_home = List<MenuHome>.empty().obs;
  LoginController loginController = Get.put(LoginController());

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void getDataItemMenu() {
    final data3 = MenuHome(
      id: "3",
      image:
          "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
      title: "Edukasi",
      color: Colors.green,
      route: Routes.INDEX_EDUCATION,
    );
    menu_home.add(data3);

    final data4 = MenuHome(
        id: "4",
        image:
            "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
        title: "Kegiatan",
        color: Colors.green,
        route: Routes.INDEX_ACTIVITY);
    menu_home.add(data4);

    final data5 = MenuHome(
      id: "5",
      image:
          "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
      title: "Kategori Edukasi",
      color: Colors.green,
      route: Routes.EDUCATION_CATEGORY,
    );
    menu_home.add(data5);

    final data6 = MenuHome(
      id: "6",
      image:
          "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
      title: "Kategori Kegiatan",
      color: Colors.green,
      route: Routes.INDEX_ACTIVITY_CATEGORY,
    );
    menu_home.add(data6);

    // final data7 = MenuHome(
    //   id: "7",
    //   image:
    //       "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
    //   title: "Produk",
    //   color: Colors.green,
    //   route: Routes.INDEX_PRODUK,
    // );
    // menu_home.add(data7);

    final data8 = MenuHome(
      id: "8",
      image:
          "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
      title: "Poktan",
      color: Colors.green,
      route: Routes.INDEX_POKTAN,
    );
    menu_home.add(data8);

    final data9 = MenuHome(
      id: "9",
      image:
          "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
      title: "Kategori Produk",
      color: Colors.green,
      route: Routes.INDEX_PRODUCT_CATEGORY,
    );
    menu_home.add(data9);

    final data10 = MenuHome(
      id: "10",
      image:
          "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
      title: "Saya",
      color: Colors.green,
      route: 'saya',
    );
    menu_home.add(data10);
  }

  @override
  void onInit() {
    // getDataItemMenu();
    // loginController.gapoktan.clear();
    // loginController.getDataGapoktan();
    super.onInit();
  }
}
