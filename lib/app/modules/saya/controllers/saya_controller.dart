import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/data/providers/gapoktan_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class SayaController extends GetxController {
  final box = GetStorage();
  // list education
  // var user = List<Gapoktan>.empty().obs;
  // upload image
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  void getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value = " Mb";
      updateImage(selectedImagePath.value);
    } else {
      Get.snackbar(
        "Warning",
        "No image Selected",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void updateImage(
    String image,
  ) {
    final data = box.read("userData") as Map<String, dynamic>;
    Map<String, String> body = {"id": data["gapoktan_id"].toString()};
    GapoktanProvider().updateImage(body, image, data["token"]).then((response) {
      print(response);
    });
  }
}
