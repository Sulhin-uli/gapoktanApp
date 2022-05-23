import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/data/models/product_category_model.dart';
import 'package:gapoktan_app/app/modules/produk/controllers/produk_controller.dart';
import 'package:gapoktan_app/app/utils/base_url.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddProdukView extends GetView<ProdukController> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'Tambah Produk',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nama Produk",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.name,
                cursorColor: Color(0xff16A085),
                decoration: InputDecoration(
                  // helperText: 'Contoh: Label',
                  // fillColor: Color(0xff919A92),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff919A92),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff16A085),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Kategori Produk",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Container(
                // padding: EdgeInsets.all(16),
                child: DropdownSearch<ProductCategory>(
                  showSearchBox: true,
                  popupItemBuilder: (context, item, isSelected) => ListTile(
                    title: Text("${item.name}"),
                  ),
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "",
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff919A92),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff16A085),
                      ),
                    ),
                    // border: border,
                  ),
                  onFind: (text) async {
                    final data = box.read("userData") as Map<String, dynamic>;
                    var token = data["token"];
                    Dio dio = new Dio();

                    dio.options.headers['content-Type'] = 'application/json';
                    dio.options.headers["authorization"] =
                        "Bearer ${data["token"]}";
                    var response = await dio.get(baseUrl + "product-category");
                    return ProductCategory.fromJsonList(response.data["data"]);
                  },
                  // onChanged: (value) => print(value?.toJson()["kota"]),
                  onChanged: (e) {
                    controller.categoryProductId.text =
                        e!.toJson()["id"].toString();
                    // print(e!.toJson()["id"]);
                  },
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Kode Produk",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.code,
                cursorColor: Color(0xff16A085),
                decoration: InputDecoration(
                  // helperText: 'Contoh: Label',
                  // fillColor: Color(0xff919A92),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff919A92),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff16A085),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Stok Produk",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.stoke,
                cursorColor: Color(0xff16A085),
                decoration: InputDecoration(
                  // helperText: 'Contoh: Label',
                  // fillColor: Color(0xff919A92),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff919A92),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff16A085),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Harga",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.price,
                cursorColor: Color(0xff16A085),
                decoration: InputDecoration(
                  // helperText: 'Contoh: Label',
                  // fillColor: Color(0xff919A92),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff919A92),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff16A085),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Deskripsi",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              TextFormField(
                maxLines: 5,
                controller: controller.desc,
                cursorColor: Color(0xff16A085),
                decoration: InputDecoration(
                  // helperText: 'Contoh: Label',
                  // fillColor: Color(0xff919A92),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff919A92),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff16A085),
                    ),
                  ),
                  fillColor: Colors.grey[100],
                  filled: true,
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  height: 46, //height of button
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff16A085), // background
                    ),
                    onPressed: () => controller.postData(
                      controller.name.text,
                      int.parse(controller.categoryProductId.text),
                      controller.code.text,
                      int.parse(controller.stoke.text),
                      int.parse(controller.price.text),
                      controller.desc.text,
                    ),
                    child: Text('Tambah'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
