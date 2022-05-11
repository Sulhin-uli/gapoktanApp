import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';
import 'package:format_indonesia/format_indonesia.dart';

import 'package:get/get.dart';

class ItemActivityView extends GetView {
  ItemActivityView(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    DateTime datetime = DateTime.parse(data.date!);
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL_ACTIVITY, arguments: data.id),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: ListTile(
                title: Container(
                    margin: EdgeInsets.only(
                      bottom: 6,
                    ),
                    child: Text(data.title)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.userId.name,
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      Waktu(datetime).yMMMMEEEEd(),
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
