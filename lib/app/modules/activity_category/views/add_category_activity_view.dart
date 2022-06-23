import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/activity_category/controllers/activity_category_controller.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

class AddCategoryActivityView extends GetView<ActivityCategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Tambah Kategori Kegiatan',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Nama Kategori",
                    style: TextStyle(
                      color: Color(0xff919A92),
                    ),
                  ),
                  TextButton(
                      onPressed: () => Get.toNamed(Routes.ACTIVITY_CATEGORY),
                      child: Text(
                        "Lihat Kategori",
                        style: TextStyle(
                          color: Color(0xff16A085),
                        ),
                      ))
                ],
              ),
              TextFormField(
                controller: controller.name,
                cursorColor: const Color(0xff16A085),
                decoration: const InputDecoration(
                  helperText: 'Contoh: Label',
                  // fillColor: Color(0xff919A92),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff919A92),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff16A085),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  height: 46, //height of button
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff16A085), // background
                    ),
                    onPressed: () => controller.postData(controller.name.text),
                    child: const Text('Tambah'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
