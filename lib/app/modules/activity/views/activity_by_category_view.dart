import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gapoktan_app/app/modules/activity/controllers/activity_controller.dart';
import 'package:gapoktan_app/app/modules/activity/views/item_activity_view.dart';
import 'package:gapoktan_app/app/modules/activity_category/controllers/activity_category_controller.dart';
import 'package:get/get.dart';

class ActivityByCategoryView extends GetView<ActivityController> {
  final categoryC = Get.find<ActivityCategoryController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: Text(
          'Kegiatan',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: Text(
              "Kategori : " + Get.arguments,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          Obx(
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
                            if (data.categoryActivityId!.name ==
                                Get.arguments) {
                              return ItemActivityView(data);
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
        ],
      ),
    );
  }
}
