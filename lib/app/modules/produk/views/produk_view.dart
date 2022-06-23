import 'package:gapoktan_app/app/modules/produk/controllers/produk_controller.dart';
import 'package:gapoktan_app/app/modules/produk/views/widgets/item_product_widget.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProdukView extends GetView<ProdukController> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var auth = box.read('isAuth');
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
              controller.resultSearch(true);
            }),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Container(
          width: double.infinity,
          height: 47,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              controller: controller.seacrh,
              readOnly: true,
              onTap: () => Get.back(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.black,
                ),
                // hintText: 'Cari...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => controller.product.isEmpty
              ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/empty-data.svg",
                        height: 100,
                        width: 100,
                      ),
                      Text(
                        "Produk Tidak Ada",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                  itemCount:
                      controller.product.where((e) => e.isActive == 1).length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) {
                    final data = controller.product[i];
                    if (data.isActive == 1) {
                      if (data.name!
                          .toLowerCase()
                          .contains(controller.seacrh.text.toLowerCase())) {
                        return ItemProduct(data);
                      } else {
                        return Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/empty-data.svg",
                                height: 100,
                                width: 100,
                              ),
                              Text(
                                "Hasil Pencarian Tidak Ada",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        );
                      }
                    } else {
                      return Container();
                    }
                  },
                ),
        ),
      ),
    );
  }
}

_buildIconButton({
  VoidCallback? onPressed,
  IconData? icon,
  int notification = 0,
}) =>
    Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          color: Colors.black,
          iconSize: 21,
        ),
        notification == 0
            ? SizedBox()
            : Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.red),
                  ),
                  constraints: BoxConstraints(minWidth: 22, minHeight: 22),
                  child: Text(
                    "$notification",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
      ],
    );
