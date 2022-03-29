import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FormEducationController extends GetxController {
  // form
  late TextEditingController category_education_id;
  late TextEditingController title;
  late TextEditingController file;
  late TextEditingController desc;

  @override
  void onInit() {
    super.onInit();

    // form
    category_education_id = TextEditingController();
    title = TextEditingController();
    file = TextEditingController();
    desc = TextEditingController();
  }
}
