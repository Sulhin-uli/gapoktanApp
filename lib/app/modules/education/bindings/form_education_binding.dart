import 'package:gapoktan_app/app/modules/education/controllers/form_education_controller.dart';
import 'package:get/get.dart';

class FormEducationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormEducationController>(
      () => FormEducationController(),
    );
  }
}
