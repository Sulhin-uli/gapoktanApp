import 'package:flutter/material.dart';
import 'package:format_indonesia/format_indonesia.dart';
import 'package:intl/intl.dart';
import 'package:gapoktan_app/app/modules/tandur/controllers/tandur_controller.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

class ItemView extends GetView<TandurController> {
  ItemView(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    DateTime datetime = DateTime.parse(data.platingDate!);
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL_TANDUR, arguments: data!.id),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.startupdonut.co.uk/sites/default/files/styles/landing_pages_lists/public/Guy_watson_249x167.png?itok=e_ct04Rx'),
              ),
              title: Text(data.farmerId.userId.name),
              subtitle: Text(
                Waktu(datetime).yMMMMEEEEd(),
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
              trailing: Wrap(
                spacing: 1, // space between two icons
                children: [
                  InkWell(
                    onTap: () =>
                        Get.toNamed(Routes.EDIT_TANDUR, arguments: data.id),
                    child: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () => controller.dialogDelete(context, data.id),
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
