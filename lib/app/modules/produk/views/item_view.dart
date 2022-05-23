import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/produk/controllers/produk_controller.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';
import 'package:gapoktan_app/app/utils/constant.dart';

import 'package:get/get.dart';

class ItemView extends GetView<ProdukController> {
  ItemView(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAIL_PRODUK, arguments: data.slug!),
      // onTap: () {},
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              child: Hero(
                  tag: data.slug,
                  child: Center(
                    child: Image.network(
                      "https://tokoterserah.com/storage/produk/thumb/604045a76c15eBERAS%20FORTUNE%205%20KG.png",
                      // fit: BoxFit.cover,
                    ),
                  )),
            ),
            ListTile(
              title: Text(
                data.name,
                style: TextStyle(
                    color: Color(0xff919A92),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              subtitle: Text(
                'Rp ${formatCurrency.format(data.price!)}',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Row(children: [
                    InkWell(
                      onTap: () => Get.toNamed(
                        Routes.EDIT_PRODUK,
                        arguments: data.id,
                      ),
                      child: Icon(
                        Icons.edit,
                        size: 23,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        controller.dialogQuestion(context, data.id);
                      },
                      child: Icon(
                        Icons.delete,
                        size: 23,
                        color: Colors.grey,
                      ),
                    )
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
