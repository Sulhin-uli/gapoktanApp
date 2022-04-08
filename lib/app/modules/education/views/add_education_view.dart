import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/education/controllers/education_controller.dart';
import 'package:gapoktan_app/app/modules/education/controllers/form_education_controller.dart';
import 'package:gapoktan_app/app/modules/education_category/controllers/education_category_controller.dart';

import 'package:get/get.dart';

class AddEducationView extends GetView<FormEducationController> {
  final educationCategoryC = Get.find<EducationCategoryController>();
  // final educationCategoryC = Get.find<EducationCategoryController>();

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
              Obx(
                () => educationCategoryC.education_category.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : DropdownButtonHideUnderline(
                        child: new DropdownButton(
                          items:
                              educationCategoryC.education_category.map((item) {
                            return new DropdownMenuItem(
                              child: new Text(
                                item.name!.toString(),
                                style: TextStyle(fontSize: 15),
                              ),
                              value: item.id!.toString(),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            educationCategoryC.onSelected(newVal.toString());
                          },
                          value: educationCategoryC.selectedValue.value != null
                              ? educationCategoryC.selectedValue.value
                              : null,
                        ),
                      ),
              ),
              Divider(color: Color(0xff919A92)),

              // Obx(
              //   () => DropdownButton(
              //     value: educationCategoryC.selectedValue.value,
              //     items: educationCategoryC.items.map((value) {
              //       return DropdownMenuItem(
              //         child: Text(value),
              //         value: value,
              //       );
              //     }).toList(),
              //     onChanged: (value) {
              //       educationCategoryC.selectedValue.value = value.toString();
              //       // print(value);
              //     },
              //   ),
              // ),
              // TextFormField(
              //   controller: controller.category_education_id,
              //   cursorColor: Color(0xff16A085),
              //   decoration: InputDecoration(
              //     helperText: 'Contoh: Label',
              //     // fillColor: Color(0xff919A92),
              //     enabledBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Color(0xff919A92),
              //       ),
              //     ),
              //     focusedBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Color(0xff16A085),
              //       ),
              //     ),
              //   ),
              // ),
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
              // TextFormField(
              //   controller: controller.file,
              //   cursorColor: Color(0xff16A085),
              //   decoration: InputDecoration(
              //     helperText: 'Contoh: Label',
              //     // fillColor: Color(0xff919A92),
              //     enabledBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Color(0xff919A92),
              //       ),
              //     ),
              //     focusedBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Color(0xff16A085),
              //       ),
              //     ),
              //   ),
              // ),
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
              // Obx(
              //   () => controller.selectedImagePath.value == ''
              //       ? Text("No image selected")
              //       : Image.file(
              //           File(controller.selectedImagePath.value),
              //         ),
              // ),
              Obx(
                () => controller.selectedImagePath.value == ''
                    ? Text("")
                    : Text(controller.selectedImageSize.value),
              ),
              const SizedBox(height: 30),
              Text(
                "Deskripsi",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.desc,
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
              Center(
                child: SizedBox(
                  height: 46, //height of button
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff16A085), // background
                    ),
                    onPressed: () => Get.find<EducationController>().add(
                      int.parse(educationCategoryC.selectedValue.value),
                      controller.title.text,
                      controller.compressedFile,
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
