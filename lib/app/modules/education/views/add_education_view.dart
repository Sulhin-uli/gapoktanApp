import 'dart:io';
import 'package:better_player/better_player.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/data/models/education_category_model.dart';
import 'package:gapoktan_app/app/modules/education/controllers/education_controller.dart';
import 'package:gapoktan_app/app/utils/base_url.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddEducationView extends GetView<EducationController> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'Tambah Edukasi',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kategori Edukasi",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Container(
                // padding: EdgeInsets.all(16),
                child: DropdownSearch<EducationCategory>(
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
                    var response =
                        await dio.get(baseUrl + "education-category");
                    return EducationCategory.fromJsonList(
                        response.data["data"]);
                  },
                  // onChanged: (value) => print(value?.toJson()["kota"]),
                  onChanged: (e) {
                    controller.category_education_id.text =
                        e!.toJson()["id"].toString();
                    // print(e!.toJson()["id"]);
                  },
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Judul",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.title,
                cursorColor: Color(0xff16A085),
                decoration: InputDecoration(
                  helperText: 'Contoh: Label',
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
                "File",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              InkWell(
                onTap: () => controller.dialogUploadFile(),
                child: Center(
                  child: DottedBorder(
                    color: Colors.green,
                    strokeWidth: 1,
                    dashPattern: [5, 5],
                    child: Container(
                      height: 80,
                      width: 140,
                      color: Colors.green[50],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.drive_folder_upload,
                            color: Colors.green,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Pilih file disini ...",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              const SizedBox(height: 30),
              Obx(
                () => controller.selectedImagePath.value != ''
                    ? Obx(
                        () => controller.selectedImagePath.value.isImageFileName
                            ? Center(
                                child: Container(
                                  height: 300,
                                  width: 300,
                                  child: Image.file(
                                    File(controller.selectedImagePath.value),
                                  ),
                                ),
                              )
                            : Hero(
                                tag: "data.slug!",
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: BetterPlayer.file(
                                    controller.selectedImagePath.value,
                                    betterPlayerConfiguration:
                                        BetterPlayerConfiguration(
                                      aspectRatio: 16 / 9,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                              ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("No File selected."),
                        ],
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
                    onPressed: () {
                      controller.isLoadingButton.value = false;
                      controller.postData(
                        int.parse(controller.category_education_id.text),
                        controller.title.text,
                        controller.selectedImagePath.value,
                        controller.desc.text,
                      );
                    },
                    child: Obx(
                      () => controller.isLoadingButton.isTrue
                          ? Text('Tambah')
                          : const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                    ),
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
