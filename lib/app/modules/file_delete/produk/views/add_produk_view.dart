// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:gapoktan_app/app/data/models/product_category_model.dart';
// import 'package:gapoktan_app/app/modules/produk/controllers/produk_controller.dart';
// import 'package:gapoktan_app/app/utils/base_url.dart';

// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class AddProdukView extends GetView<ProdukController> {
//   final box = GetStorage();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: const BackButton(color: Colors.black),
//         title: const Text(
//           'Tambah Produk',
//           style: TextStyle(color: Colors.black, fontSize: 16),
//         ),
//         elevation: 0.5,
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const Text(
//               "Nama Produk",
//               style: TextStyle(
//                 color: Color(0xff919A92),
//               ),
//             ),
//             TextFormField(
//               controller: controller.name,
//               cursorColor: const Color(0xff16A085),
//               decoration: const InputDecoration(
//                 // helperText: 'Contoh: Label',
//                 // fillColor: Color(0xff919A92),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color(0xff919A92),
//                   ),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color(0xff16A085),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               "Kategori Produk",
//               style: TextStyle(
//                 color: Color(0xff919A92),
//               ),
//             ),
//             const SizedBox(
//               height: 9,
//             ),
//             Container(
//               // padding: EdgeInsets.all(16),
//               child: DropdownSearch<ProductCategory>(
//                 showSearchBox: true,
//                 popupItemBuilder: (context, item, isSelected) => ListTile(
//                   title: Text("${item.name}"),
//                 ),
//                 dropdownSearchDecoration: const InputDecoration(
//                   labelText: "",
//                   contentPadding: EdgeInsets.symmetric(
//                     vertical: 10,
//                     horizontal: 15,
//                   ),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xff919A92),
//                     ),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xff16A085),
//                     ),
//                   ),
//                   // border: border,
//                 ),
//                 onFind: (text) async {
//                   final data = box.read("userData") as Map<String, dynamic>;
//                   var token = data["token"];
//                   Dio dio = Dio();

//                   dio.options.headers['content-Type'] = 'application/json';
//                   dio.options.headers["authorization"] =
//                       "Bearer ${data["token"]}";
//                   var response = await dio.get(baseUrl + "product-category");
//                   return ProductCategory.fromJsonList(response.data["data"]);
//                 },
//                 // onChanged: (value) => print(value?.toJson()["kota"]),
//                 onChanged: (e) {
//                   controller.categoryProductId.text =
//                       e!.toJson()["id"].toString();
//                   // print(e!.toJson()["id"]);
//                 },
//               ),
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               "Kode Produk",
//               style: TextStyle(
//                 color: Color(0xff919A92),
//               ),
//             ),
//             TextFormField(
//               controller: controller.code,
//               cursorColor: const Color(0xff16A085),
//               decoration: const InputDecoration(
//                 // helperText: 'Contoh: Label',
//                 // fillColor: Color(0xff919A92),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color(0xff919A92),
//                   ),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color(0xff16A085),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               "Stok Produk",
//               style: TextStyle(
//                 color: Color(0xff919A92),
//               ),
//             ),
//             TextFormField(
//               controller: controller.stoke,
//               cursorColor: const Color(0xff16A085),
//               decoration: const InputDecoration(
//                 // helperText: 'Contoh: Label',
//                 // fillColor: Color(0xff919A92),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color(0xff919A92),
//                   ),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color(0xff16A085),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               "Harga",
//               style: TextStyle(
//                 color: Color(0xff919A92),
//               ),
//             ),
//             TextFormField(
//               controller: controller.price,
//               cursorColor: const Color(0xff16A085),
//               decoration: const InputDecoration(
//                 // helperText: 'Contoh: Label',
//                 // fillColor: Color(0xff919A92),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color(0xff919A92),
//                   ),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color(0xff16A085),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               "Deskripsi",
//               style: TextStyle(
//                 color: Color(0xff919A92),
//               ),
//             ),
//             const SizedBox(
//               height: 9,
//             ),
//             TextFormField(
//               maxLines: 5,
//               controller: controller.desc,
//               cursorColor: const Color(0xff16A085),
//               decoration: InputDecoration(
//                 // helperText: 'Contoh: Label',
//                 // fillColor: Color(0xff919A92),
//                 enabledBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color(0xff919A92),
//                   ),
//                 ),
//                 focusedBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Color(0xff16A085),
//                   ),
//                 ),
//                 fillColor: Colors.grey[100],
//                 filled: true,
//               ),
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               "Foto Produk",
//               style: TextStyle(
//                 color: Color(0xff919A92),
//               ),
//             ),
//             InkWell(
//               // onTap: () => controller.dialogUploadFile(),
//               onTap: () => controller.getMultipleImage(),
//               child: Center(
//                 child: DottedBorder(
//                   color: Colors.green,
//                   strokeWidth: 1,
//                   dashPattern: const [5, 5],
//                   child: Container(
//                     height: 80,
//                     width: 140,
//                     color: Colors.green[50],
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Icon(
//                           Icons.drive_folder_upload,
//                           color: Colors.green,
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           "Pilih file disini ...",
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.black.withOpacity(0.5),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 3,
//             ),
//             Obx(
//               () => controller.selectedImagePath.isNotEmpty
//                   ? SizedBox(
//                       height: 200,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: controller.selectedImagePath.length,
//                         itemBuilder: (context, index) {
//                           return Container(
//                             margin: const EdgeInsets.all(5),
//                             child: Image.file(
//                               File(controller.selectedImagePath[index].path),
//                               fit: BoxFit.cover,
//                             ),
//                           );
//                         },
//                       ),
//                     )
//                   // : Container(),
//                   : const Text("No image selected"),
//             ),
//             const SizedBox(height: 5),
//             Obx(
//               () => controller.selectedImagePath.isNotEmpty
//                   ? SizedBox(
//                       height: 26, //height of button
//                       width: 150,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.grey, // background
//                         ),
//                         onPressed: () {
//                           controller.selectedImagePath.clear();
//                         },
//                         child: const Text('Bersihkan Foto'),
//                       ),
//                     )
//                   : Container(),
//             ),
//             const SizedBox(height: 30),
//             Center(
//               child: SizedBox(
//                 height: 46, //height of button
//                 width: 300,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     primary: const Color(0xff16A085), // background
//                   ),
//                   onPressed: () {
//                     controller.postData(
//                       controller.name.text,
//                       int.parse(controller.categoryProductId.text),
//                       controller.code.text,
//                       int.parse(controller.stoke.text),
//                       int.parse(controller.price.text),
//                       controller.desc.text,
//                     );
//                   },
//                   child: const Text('Tambah'),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
