import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/product_category/controllers/product_category_controller.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

class ItemViewCategoryProduct extends GetView<ProductCategoryController> {
  ItemViewCategoryProduct(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: Text(data.name),
            trailing: Wrap(
              spacing: 1, // space between two icons
              children: [
                InkWell(
                  onTap: () => Get.toNamed(Routes.EDIT_PRODUCT_CATEGORY,
                      arguments: data.id),
                  child: Icon(
                    Icons.edit,
                    size: 20,
                  ),
                ),
                SizedBox(width: 5),
                InkWell(
                  onTap: () => controller.dialogQuestion(context, data.id),
                  child: Icon(
                    Icons.delete,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}