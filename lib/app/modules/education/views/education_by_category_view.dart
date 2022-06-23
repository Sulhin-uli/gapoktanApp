import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gapoktan_app/app/modules/education/views/item_view.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/education_controller.dart';

class EducationByCategoryView extends GetView<EducationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: Text(
          'Edukasi',
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
      body: Obx(
        () {
          if (controller.isLoading.isTrue) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.isLoading.isFalse) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                      itemCount: controller.education.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        final data = controller.education[i];
                        if (data.categoryEducationId!.name == Get.arguments) {
                          return ItemView(data);
                        } else {
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
