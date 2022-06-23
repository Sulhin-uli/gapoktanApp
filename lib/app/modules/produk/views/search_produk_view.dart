import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/produk/controllers/produk_controller.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

class SearchProdukView extends GetView<ProdukController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
              controller.seacrh.clear();
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
              autofocus: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.grey[200],
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    controller.runSearch(controller.seacrh.text);
                  },
                ),
                hintText: 'Cari...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: Text(
                "Kategori",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            Obx(() => ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.productCategory.length,
                  itemBuilder: (context, i) {
                    final dataCategory = controller.productCategory[i];
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: ListTile(
                        onTap: () {
                          Get.toNamed(Routes.KATEGORI_VIEW,
                              arguments: dataCategory.name);
                        },
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black26,
                          child: Image.asset(
                            "assets/icons/kategori.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                        title: Text(
                          (dataCategory.name! != null)
                              ? dataCategory.name!
                              : "Kategori",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
