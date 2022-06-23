import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gapoktan_app/app/modules/activity/views/item_activity_view.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/activity_controller.dart';

class IndexActivityView extends GetView<ActivityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Kegiatan',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.SEARCH_FORM_ACTIVITY);
            },
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
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
                      itemCount: controller.activity.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        // final product = productList[index];
                        final data = controller.activity[i];
                        return ItemActivityView(data);
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
        onPressed: () => Get.toNamed(Routes.ADD_ACTIVITY),
        child: const Icon(Icons.add),
      ),
    );
  }
}
