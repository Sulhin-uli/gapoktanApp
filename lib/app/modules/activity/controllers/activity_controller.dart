import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gapoktan_app/app/modules/activity/models/activity_model.dart';
import 'package:gapoktan_app/app/modules/activity/providers/activity_provider.dart';
import 'package:get/get.dart';

class ActivityController extends GetxController {
  // list education
  var activity = List<Activity>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    // panggil fetch data
    fetchData();
  }

  // dialog Error
  void dialogError(String msg) {
    Get.defaultDialog(
      title: "Terjadi Kesalahan",
      content: Text(
        msg,
        textAlign: TextAlign.center,
      ),
    );
  }

  // dialog sukses
  void dialogSuccess(String msg) {
    Get.defaultDialog(
      title: "Berhasil",
      content: Text(
        msg,
        textAlign: TextAlign.center,
      ),
    );
  }

  void dialogQuestion(String title, String msg, BuildContext context, int id) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Batal'),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Ya');
              delete(id);
            },
            child: Text('Ya'),
          ),
        ],
      ),
    );
  }

  // get data
  Future fetchData() async {
    return ActivityProvider().fetchData().then((response) {
      // print(response);
      // print(response[0][0]["category_education_id"]["id"]);
      for (var i = 0; i < response[0].length; i++) {
        final data = Activity(
          id: response[0][i]["id"],
          // userId: response[0][i]["user_id"],
          userId: 1,
          categoryActivityId: response[0][i]["category_activity_id"]["id"],
          // categoryEducationId: response[0][i]["category_education_id"]["id"],
          title: response[0][i]["title"],
          slug: response[0][i]["slug"],
          date: response[0][i]["date"],
          desc: response[0][i]["desc"],
          createdAt: response[0][i]["created_at"],
          updatedAt: response[0][i]["updated_at"],
        );
        activity.add(data);
      }
    });
  }

  // add data
  void add(
    int category_activity_id,
    String title,
    String desc,
  ) async {
    int userId = 1;
    // final pickedFile = await ImagePicker().getImage(source: imageSource);

    if (category_activity_id != null && title != '' && desc != '') {
      ActivityProvider()
          .postData(userId, category_activity_id, title, desc)
          .then((response) {
        print(response);
        // final data = Education(
        //   id: response[1]["id"],
        //   userId: response[1]["user_id"],
        //   categoryEducationId: response[1]["category_education_id"]["id"],
        //   title: response[1]["title"],
        //   slug: response[1]["slug"],
        //   date: response[1]["date"],
        //   file: response[1]["file"],
        //   desc: response[1]["desc"],
        //   createdAt: response[1]["created_at"],
        //   updatedAt: response[1]["updated_at"],
        // );
        // education.insert(0, data);
        // print(response[1]["id"]);
        Get.back();
        //  Get.offAllNamed(Routes.MENU);
        dialogSuccess("data berhasil ditambahkan!");
      });
    } else {
      dialogError("Semua Input Harus Diisi");
    }
  }

  // cari berdasarka id
  Activity findByid(int id) {
    return activity.firstWhere((element) => element.id == id);
  }

  void edit(
    int id,
    int categoryActivityId,
    String title,
    String file,
    String desc,
  ) {
    int user_id = 1;
    final data = findByid(id);
    ActivityProvider()
        .updateData(id, user_id, categoryActivityId, file, desc)
        .then((_) {
      // print(respon);
      // data.categoryActivityId = categoryActivityId;
      // data.title = title;
      // data.desc = desc;
      // activity.refresh();
      // fetchData();
      Get.back();
    });
  }

  void delete(int id) {
    ActivityProvider()
        .deleteData(id)
        .then((_) => activity.removeWhere((element) => element.id == id));
    Get.back();
    dialogSuccess("data berhasil dihapus!");
  }
}
