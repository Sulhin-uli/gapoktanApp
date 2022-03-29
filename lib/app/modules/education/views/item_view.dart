import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

class ItemView extends GetView {
  ItemView(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL_EDUCATION, arguments: data.id),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: data.id,
                child: Center(
                  child: Image.network(
                    "https://www.thehindu.com/sci-tech/agriculture/87sx5z/article30131510.ece/alternates/LANDSCAPE_615/NEWS2FARMER",
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Text(
                data.title,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
