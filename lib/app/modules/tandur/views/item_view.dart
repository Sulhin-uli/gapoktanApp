import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/tandur/controllers/tandur_controller.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ItemView extends GetView<TandurController> {
  const ItemView(this.data);
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
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.startupdonut.co.uk/sites/default/files/styles/landing_pages_lists/public/Guy_watson_249x167.png?itok=e_ct04Rx'),
              ),
              title: Text(data.farmerId.userId.name),
              subtitle: Text(
                DateFormat("EEEE, d MMMM yyyy", "id_ID").format(datetime),
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
