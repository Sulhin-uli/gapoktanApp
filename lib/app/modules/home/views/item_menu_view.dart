import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class ItemMenuView extends GetView<HomeController> {
  ItemMenuView(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: index % 2 == 0 ? Colors.amber : Colors.red,
          width: 45,
          height: 45,
          child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide(color: Colors.black12)),
            padding: EdgeInsets.all(8),
            color: Colors.white,
            onPressed: () {},
            child: Image.network(
              "https://cdn.icon-icons.com/icons2/3361/PNG/512/preferences_user_interface_ux_apps_grid_options_ui_menu_categories_icon_210806.png",
              color: Colors.green,
            ),
          ),
        ),
        SizedBox(
          height: 11,
        ),
        Text(
          "Menu Title",
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.amber[700]),
        ),
      ],
    );
  }
}
