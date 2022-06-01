import 'package:gapoktan_app/app/modules/saya/controllers/saya_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<SayaController>(
      () => SayaController(),
    );
  }
}
