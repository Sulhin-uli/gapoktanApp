import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/poktan/controllers/poktan_controller.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';
import 'package:gapoktan_app/app/utils/base_url.dart';

import 'package:get/get.dart';

class ItemView extends GetView<PoktanController> {
  const ItemView(this.data);
  final data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL_POKTAN, arguments: data.id!),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: (data.image == null)
                  ? CircleAvatar(
                      backgroundImage: AssetImage("assets/images/noimage.png"),
                    )
                  : CircleAvatar(
                      backgroundImage: NetworkImage(
                        baseUrlFile + "storage/profile/" + data.image!,
                      ),
                    ),
              title: Text(data.userId!.name),
              trailing: Wrap(
                spacing: 1, // space between two icons
                children: [
                  InkWell(
                    onTap: () =>
                        Get.toNamed(Routes.EDIT_POKTAN, arguments: data.id),
                    child: const Icon(
                      Icons.edit,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 5),
                  InkWell(
                    onTap: () =>
                        controller.dialogQuestion(context, data.userId!.id!),
                    child: const Icon(
                      Icons.delete,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
