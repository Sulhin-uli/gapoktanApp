import 'package:gapoktan_app/app/data/models/gapoktan_model.dart';
import 'package:gapoktan_app/app/data/providers/login_provider.dart';
import 'package:gapoktan_app/app/data/models/user_model.dart';
import 'package:gapoktan_app/app/data/providers/gapoktan_provider.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthcontrollerController extends GetxController {
  final box = GetStorage();
  var isAuth = false.obs;
  var gapoktan = List<Gapoktan>.empty().obs;

  void dialogError(String msg) {
    Get.defaultDialog(title: "Terjadi Kesalahan", middleText: msg);
  }

  @override
  void onInit() {
    autoLogin();
    super.onInit();
  }

  Future<void> autoLogin() async {
    if (box.read("userData") != null) {
      final data = box.read("userData") as Map<String, dynamic>;
      login(data["email"], data["password"]);
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.offAllNamed(Routes.LOGIN);
      });
    }
  }

  void login(String email, String password) async {
    LoginProvider().login(email, password).then(
      (response) {
        if (email != '' && password != '') {
          if (response['success'] == true) {
            box.write('userData', {
              "id": response['data']['id'],
              "token": response['data']['token'],
              "name": response['data']["name"],
              "email": email,
              "password": password
            });
            box.write('isAuth', true);
            isAuth.value = true;

            getDataGapoktan();
            Get.offAllNamed(Routes.HOME);
          } else {
            Get.offAllNamed(Routes.LOGIN);
            dialogError('Akun tidak ditemukan');
          }
        } else {
          dialogError('Semua data input harus di isi');
        }
      },
    );
  }

  void getDataGapoktan() async {
    final data = box.read("userData") as Map<String, dynamic>;
    GapoktanProvider().getData(data["token"]).then((response) {
      try {
        response["data"].map((e) {
          final data = Gapoktan(
            id: e["id"],
            userId: User(
              id: e["user_id"]["id"],
              name: e["user_id"]["name"],
            ),
            chairman: e["chairman"],
            city: e["city"],
            address: e["address"],
            telp: e["telp"].toString(),
            image: e["image"],
          );
          gapoktan.add(data);
        }).toList();
        final data = box.read("userData") as Map<String, dynamic>;
        box.write('userData', {
          "id": data['id'],
          "token": data["token"],
          "name": data["name"],
          "email": data["email"],
          "password": data["password"],
          "gapoktan_id": findGapoktan(data["id"]).id,
        });
      } catch (e) {
        print("Error is : " + e.toString());
      }
    });
  }

  Gapoktan findGapoktan(int id) {
    return gapoktan.firstWhere((e) => e.userId!.id! == id);
  }
}
