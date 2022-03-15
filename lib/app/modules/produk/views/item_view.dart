import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ItemView extends GetView {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Get.toNamed(Routes.DETAIL_EDUKASI),
      onTap: () {},
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              child: Hero(
                  tag: 'judul',
                  child: Center(
                    child: Image.network(
                      "https://tokoterserah.com/storage/produk/thumb/604045a76c15eBERAS%20FORTUNE%205%20KG.png",
                      // fit: BoxFit.cover,
                    ),
                  )),
            ),
            ListTile(
              title: Text(
                'Produck Title',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
              ),
              subtitle: Text(
                'Rp. 100.000',
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
