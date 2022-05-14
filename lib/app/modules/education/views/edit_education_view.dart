import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/education/controllers/education_controller.dart';
import 'package:gapoktan_app/app/modules/education/controllers/form_education_controller.dart';
import 'package:gapoktan_app/app/modules/education_category/controllers/education_category_controller.dart';

import 'package:get/get.dart';

class EditEducationView extends GetView<FormEducationController> {
  final educationC = Get.find<EducationController>();
  final educationCategoryC = Get.find<EducationCategoryController>();

  @override
  Widget build(BuildContext context) {
    final data = educationC.findByid(Get.arguments);
    controller.category_education_id.text = data.categoryEducationId.toString();
    // print(data.categoryEducationId.toString());
    controller.title.text = data.title!;
    controller.file.text = data.file!;
    controller.desc.text = data.desc!;
    // educationCategoryC.changeEditCategory(data.categoryEducationId!);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'Ubah Edukasi',
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
                          value:
                              educationCategoryC.selectedEditValue.value != null
                                  ? educationCategoryC.selectedEditValue.value
                                  : null,
                        ),
                      ),
              ),
              Divider(color: Color(0xff919A92)),
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
                "Gambar atau Vidio",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.file,
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
                    onPressed: () => educationC.edit(
                      Get.arguments,
                      controller.category_education_id.text,
                      controller.title.text,
                      controller.file.text,
                      controller.desc.text,
                    ),
                    child: Text('Ubah'),
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
