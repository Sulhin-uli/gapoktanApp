import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

class ItemActivityView extends GetView {
  ItemActivityView(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL_ACTIVITY, arguments: data.id),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: ListTile(
                title: Text(data.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.userId.toString(),
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      data.date,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
