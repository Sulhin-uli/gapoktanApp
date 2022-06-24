import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/poktan/views/item_view.dart';
import 'package:gapoktan_app/app/modules/poktan/controllers/poktan_controller.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchPoktanView extends GetView<PoktanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: Container(
          width: double.infinity,
          height: 47,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              controller: controller.seacrh,
              readOnly: true,
              onTap: () => Get.back(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.black,
                ),
                // hintText: 'Cari...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () {
          if (controller.isLoading.isTrue) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.isLoading.isFalse) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: controller.poktan.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final data = controller.poktan[index];
                        if (data.userId!.name!
                            .toLowerCase()
                            .contains(controller.seacrh.text.toLowerCase())) {
                          return ItemView(data);
                        } else {
                          return Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/empty-data.svg",
                                  height: 100,
                                  width: 100,
                                ),
                                Text(
                                  "Hasil Pencarian Tidak Ada",
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            );
          } else
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/empty-data.svg",
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    "Data Tidak Ada",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            );
        },
      ),
    );
  }
}
