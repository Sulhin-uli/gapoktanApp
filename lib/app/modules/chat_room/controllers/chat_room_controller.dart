import 'package:get/get.dart';

class ChatRoomController extends GetxController {
  //TODO: Implement ChatRoomController

  final count = 0.obs;


  @override
  void onClose() {}
  void increment() => count.value++;
}
