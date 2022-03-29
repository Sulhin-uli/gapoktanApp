import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/education/views/item_view.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/education_controller.dart';

class IndexEducationView extends GetView<EducationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xff5D8BF4),
      //   elevation: 0,
      // ),
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.education.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
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
                          // final product = productList[index];
                          final data = controller.education[i];
                          return ItemView(data);
                        },
                      )
                    ],
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff16A085),
        foregroundColor: Colors.white,
        heroTag: 'add',
        // mini: true,
        onPressed: () => Get.toNamed(Routes.ADD_EDUCATION),
        child: Icon(Icons.add),
      ),
    );
  }
}
