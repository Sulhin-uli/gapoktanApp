import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gapoktan_app/app/data/models/product_category_model.dart';
import 'package:gapoktan_app/app/data/models/product_model.dart';
import 'package:gapoktan_app/app/data/models/user_model.dart';
import 'package:gapoktan_app/app/data/providers/product_provider.dart';
import 'package:gapoktan_app/app/utils/constant.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProdukController extends GetxController {
  final box = GetStorage();
  late TextEditingController name;
  late TextEditingController categoryProductId;
  late TextEditingController code;
  late TextEditingController stoke;
  late TextEditingController price;
  late TextEditingController desc;
  var product = List<Product>.empty().obs;

  @override
  void onInit() {
    name = TextEditingController();
    categoryProductId = TextEditingController();
    code = TextEditingController();
    stoke = TextEditingController();
    price = TextEditingController();
    desc = TextEditingController();

    super.onInit();
  }

  // add data
  void postData(
    String name,
    int categoryProductId,
    String code,
    int stoke,
    int price,
    String desc,
  ) async {
    final data = box.read("userData") as Map<String, dynamic>;
    if (name != '') {
      ProductProvider()
          .postData(name, categoryProductId, data["id"], code, stoke, price,
              desc, data["token"])
          .then((response) {
        // print(response);
        final data = Product(
          id: response["data"]["id"],
          name: response["data"]["name"],
          slug: response["data"]["slug"],
          categoryProductId: ProductCategory(
            id: response["data"]["category_product_id"]["id"],
            name: response["data"]["category_product_id"]["name"],
            slug: response["data"]["category_product_id"]["slug"],
            createdAt: response["data"]["category_product_id"]["created_at"],
            updatedAt: response["data"]["category_product_id"]["updated_at"],
          ),
          code: response["data"]["code"],
          stoke: response["data"]["stoke"],
          price: response["data"]["price"],
          desc: response["data"]["desc"],
          userId: User(
            id: response["data"]["category_product_id"]["id"],
            name: response["data"]["category_product_id"]["name"],
          ),
          isActive: response["data"]["isActive"],
        );
        product.insert(0, data);
        Get.back();
        dialog("Berhasil !", "data berhasil ditambahkan!");
      });
    } else {
      dialog("Terjadi Kesalahan", "Semua Input Harus Diisi");
    }
  }

  // cari berdasarka id
  Product findByid(int id) {
    return product.firstWhere((element) => element.id == id);
  }

  void updateData(
    int id,
    String name,
    int categoryProductId,
    String code,
    int stoke,
    int price,
    String desc,
  ) {
    final data = box.read("userData") as Map<String, dynamic>;
    final item = findByid(id);
    ProductProvider()
        .updateData(id, name, categoryProductId, data["id"], code, stoke, price,
            desc, data["token"])
        .then((e) {
      item.name = name;
      item.categoryProductId!.id = categoryProductId;
      item.userId = data["id"];
      item.code = code;
      item.stoke = stoke;
      item.price = price;
      item.desc = desc;
      product.refresh();
      Get.back();
      Get.back();
      Get.back();
      dialog("Berhasil !", "data berhasil diubah!");
    });
  }

  void delete(int id) {
    final data = box.read("userData") as Map<String, dynamic>;
    ProductProvider()
        .deleteData(id, data["token"])
        .then((_) => product.removeWhere((element) => element.id == id));
    Get.back();
    Get.back();
    dialog("Berhasil !", "data berhasil dihapus!");
  }

  void dialogQuestion(String title, String msg, BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Batal'),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'Ya'),
            child: Text('Ya'),
          ),
        ],
      ),
    );
  }
}
