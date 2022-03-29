import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gapoktan_app/app/modules/education/models/education_model.dart';
import 'package:gapoktan_app/app/modules/education/providers/education_provider.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class EducationController extends GetxController {
  // list education
  var education = List<Education>.empty().obs;
  // show video
  late VideoPlayerController videoPlayerController;
  ChewieController? cheviewController;

  @override
  void onInit() {
    super.onInit();
    // panggil fetch data
    fetchData();
    // putar video
    initializedPlayer();
  }

  @override
  void onClose() {
    super.onClose();
    videoPlayerController.dispose();
    cheviewController!.dispose();
  }

  // pop up
  void dialogDelete(int? id, BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Hapus"),
        content: Text("Yakin menghapus data?"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Batal'),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              EducationProvider().deleteData(id).then(
                  (_) => education.removeWhere((element) => element.id == id));
              Get.back();
              dialogSuccess("Data berhasil dihapus!");
            },
            child: Text('Ya'),
          ),
        ],
      ),
    );
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
        ));
  }

  // get data
  Future fetchData() async {
    return EducationProvider().fetchData().then((response) {
      // print(response);
      for (var i = 0; i < response[0].length; i++) {
        final data = Education(
          id: response[0][i]["id"],
          userId: response[0][i]["user_id"],
          categoryEducationId: response[0][i]["category_education_id"],
          title: response[0][i]["title"],
          slug: response[0][i]["slug"],
          date: response[0][i]["date"],
          file: response[0][i]["file"],
          desc: response[0][i]["desc"],
          createdAt: response[0][i]["created_at"],
          updatedAt: response[0][i]["updated_at"],
        );
        education.add(data);
      }
    });
  }

  // add data
  void add(
    int category_education_id,
    String title,
    String file,
    String desc,
  ) {
    int user_id = 1;
    if (category_education_id != '' &&
        title != '' &&
        file != '' &&
        desc != '') {
      EducationProvider()
          .postData(user_id, category_education_id, title, file, desc)
          .then((response) {
        final data = Education(
          id: response[1]["id"],
          userId: response[1]["user_id"],
          categoryEducationId: response[1]["category_education_id"],
          title: response[1]["title"],
          slug: response[1]["slug"],
          date: response[1]["date"],
          file: response[1]["file"],
          desc: response[1]["desc"],
          createdAt: response[1]["created_at"],
          updatedAt: response[1]["updated_at"],
        );
        education..insert(0, data);
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
  Education findByid(int id) {
    return education.firstWhere((element) => element.id == id);
  }

  void edit(
    int id,
    int category_education_id,
    String title,
    String file,
    String desc,
  ) {
    int user_id = 1;
    final data = findByid(id);
    EducationProvider()
        .updateData(id, user_id, category_education_id, title, file, desc)
        .then((_) {
      data.categoryEducationId = category_education_id;
      data.title = title;
      data.file = file;
      data.desc = desc;
      education.refresh();
      fetchData();
      Get.back();
    });
  }

  // void delete(int? id) {
  //   EducationProvider()
  //       .deleteData(id)
  //       .then((_) => education.removeWhere((element) => element.id == id));
  //   Get.offAndToNamed(Routes.INDEX_EDUCATION);
  //   fetchData();
  //   dialogSuccess("Data berhasil dihapus!");
  // }

  Future<void> initializedPlayer() async {
    videoPlayerController = VideoPlayerController.network(
      "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    );

    await Future.wait([videoPlayerController.initialize()]);
    cheviewController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.cyanAccent,
        backgroundColor: Colors.yellow,
        bufferedColor: Colors.lightGreen,
      ),
      placeholder: Container(
        color: Colors.greenAccent,
      ),
      autoInitialize: true,
    );

    update();
  }
}
