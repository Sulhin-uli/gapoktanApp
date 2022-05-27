import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/poktan/controllers/poktan_controller.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

class ItemView extends GetView<PoktanController> {
  ItemView(this.data);
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
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.startupdonut.co.uk/sites/default/files/styles/landing_pages_lists/public/Guy_watson_249x167.png?itok=e_ct04Rx'),
              ),
              title: Text(data.userId!.name),
              trailing: Wrap(
                spacing: 1, // space between two icons
                children: [
                  InkWell(
                    onTap: () =>
                        Get.toNamed(Routes.EDIT_POKTAN, arguments: data.id),
                    child: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () =>
                        controller.dialogQuestion(context, data.userId!.id!),
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
      ),
    );
  }
}
