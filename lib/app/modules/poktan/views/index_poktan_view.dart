import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gapoktan_app/app/modules/poktan/views/item_view.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/poktan_controller.dart';

class IndexPoktanView extends GetView<PoktanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: Obx(
          () => controller.isSearch.isFalse
              ? Text(
                  'Poktan',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )
              : Container(
                  width: double.infinity,
                  height: 47,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: TextField(
                      controller: controller.seacrh,
                      autofocus: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.grey[200],
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            controller.runSearch(controller.seacrh.text);
                          },
                        ),
                        hintText: 'Cari...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
        ),
        actions: [
          Obx(
            () => controller.isSearch.isFalse
                ? IconButton(
                    onPressed: () {
                      controller.isSearch(true);
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ))
                : IconButton(
                    onPressed: () {
                      controller.isSearch(false);
                    },
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.grey,
                    ),
                  ),
          )
        ],
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
                        return ItemView(data);
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff16A085),
        foregroundColor: Colors.white,
        // mini: true,
        onPressed: () => Get.toNamed(Routes.ADD_POKTAN),
        child: const Icon(Icons.add),
      ),
    );
  }
}
