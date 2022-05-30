import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/panen/views/item_view.dart';

import 'package:get/get.dart';
import 'package:gapoktan_app/app/modules/tandur/controllers/tandur_controller.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';

class IndexPanenView extends GetView<TandurController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'Jadwal Panen',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      body: Obx(
        () => controller.plantPanen.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: controller.plantPanen.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final data = controller.plantPanen[index];
                          return ItemView(data);
                        },
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
