import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/data/models/gapoktan_model.dart';
import 'package:gapoktan_app/app/data/models/poktan_model.dart';
import 'package:gapoktan_app/app/data/models/user_model.dart';
import 'package:gapoktan_app/app/data/providers/poktan_provider.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';
import 'package:gapoktan_app/app/utils/constant.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PoktanController extends GetxController {
  final box = GetStorage();
  var poktan = List<Poktan>.empty().obs;
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController password2;
  late TextEditingController seacrh;
  var hiddenTextPassword = true.obs;
  var hiddenTextPassword2 = true.obs;
  var isLoading = true.obs;
  var isSearch = false.obs;

  @override
  void onInit() {
    getData();
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    password2 = TextEditingController();
    seacrh = TextEditingController();
    super.onInit();
  }

  void runSearch(String search) {
    if (search == "") {
      dialog("Peringatan", "Kolom tidak boleh kosong");
    } else {
      Get.toNamed(Routes.SEARCH_POKTAN);
    }
  }

  // add data
  void postData(
    String name,
    String email,
    String password,
    String password2,
  ) async {
    final data = box.read("userData") as Map<String, dynamic>;
    bool isActive = true;
    if (name != '') {
      if (password == password2) {
        try {
          PoktanProvider()
              .postData(name, email, password, data["gapoktan_id"], isActive,
                  data["token"])
              .then((response) {
            final data = Poktan(
              id: response["data"]["id"],
              userId: User(
                id: response["data"]["user_id"]["id"],
                name: response["data"]["user_id"]["name"],
                email: response["data"]["user_id"]["email"],
              ),
              gapoktanId: Gapoktan(
                  id: response["data"]["gapoktan_id"]["id"],
                  userId: User(
                    id: response["data"]["gapoktan_id"]["user_id"]["id"],
                    name: response["data"]["gapoktan_id"]["user_id"]["name"],
                  )),
              city: response["data"]["city"],
              address: response["data"]["address"],
              telp: response["data"]["telp"],
              image: response["data"]["image"],
              isActive: response["data"]["isActive"],
            );
            poktan.insert(0, data);
            Get.back();
            dialog("Berhasil !", "data berhasil ditambahkan!");
          });
        } catch (e) {
          print("Error is : " + e.toString());
        }
      } else {
        dialog("Terjadi Kesalahan", "Konfirmasi password tidak sama");
      }
    } else {
      dialog("Terjadi Kesalahan", "Semua Input Harus Diisi");
    }
  }

  void getData() async {
    final data = box.read("userData") as Map<String, dynamic>;
    try {
      try {
        isLoading(true);
        PoktanProvider().getData(data["token"]).then((response) {
          response["data"].map((e) {
            final data = Poktan(
              id: e["id"],
              userId: User(
                id: e["user_id"]["id"],
                name: e["user_id"]["name"],
                email: e["user_id"]["email"],
              ),
              gapoktanId: Gapoktan(
                id: e["gapoktan_id"]["id"],
                userId: User(
                  id: e["gapoktan_id"]["user_id"]["id"],
                  name: e["gapoktan_id"]["user_id"]["name"],
                  email: e["gapoktan_id"]["user_id"]["email"],
                ),
              ),
              city: e["city"],
              chairman: e["chairman"],
              address: e["address"],
              telp: e["telp"],
              image: e["image"],
              isActive: e["isActive"],
            );
            poktan.add(data);
          }).toList();
        });
      } catch (e) {
        print("error is :" + e.toString());
      }
    } finally {
      isLoading(false);
    }
  }

  Poktan findByid(int id) {
    return poktan.firstWhere((element) => element.id == id);
  }

  void editData(
    int id,
    int userId,
    String name,
    String email,
    String? password,
    String? password2,
  ) {
    final item = findByid(id);
    final data = box.read("userData") as Map<String, dynamic>;
    bool isActive = true;
    PoktanProvider()
        .updateData(id, userId, name, email, password, data["gapoktan_id"],
            true, data["token"])
        .then((_) {
      item.userId!.name = name;
      item.userId!.email = email;
      item.isActive = isActive;
      poktan.refresh();
      Get.back();
      dialog("Berhasil !", "data berhasil diubah");
    });
  }

  void deleteData(int id) {
    final data = box.read("userData") as Map<String, dynamic>;
    PoktanProvider()
        .deleteData(id, data["token"])
        .then((_) => poktan.removeWhere((element) => element.userId!.id == id));
    // Get.back();
    dialog("Berhasil !", "data berhasil dihapus!");
  }

  void dialogQuestion(BuildContext context, int id) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("Peringatan"),
        content: const Text("Yakin menghapus data?"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Batal'),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Ya');
              deleteData(id);
              // print(id);
            },
            child: const Text('Ya'),
          ),
        ],
      ),
    );
  }
}
