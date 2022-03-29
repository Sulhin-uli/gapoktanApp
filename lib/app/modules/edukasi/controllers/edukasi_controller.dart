import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gapoktan_app/app/modules/edukasi/models/edukasi_model.dart';
import 'package:gapoktan_app/app/modules/edukasi/providers/edukasi_provider.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class EdukasiController extends GetxController {
  var edukasi = List<Edukasi>.empty().obs;
  late VideoPlayerController dummyVideo;

  Future getData() async {
    return EdukasiProvider().fetchData().then((response) {
      // print(response[0].length);
      for (var i = 0; i < response[0].length; i++) {
        final data = Edukasi(
          id: response[0][i]["id"],
          userId: response[0][i]["userId"],
          categoryEducationId: response[0][i]["categoryEducationId"],
          title: response[0][i]["title"],
          slug: response[0][i]["slug"],
          date: response[0][i]["date"],
          file: response[0][i]["file"],
          desc: response[0][i]["desc"],
          createdAt: response[0][i]["createdAt"],
          updatedAt: response[0][i]["updatedAt"],
        );
        edukasi.add(data);
      }
    });
  }

  Edukasi findByid(int id) {
    return edukasi.firstWhere((element) => element.id == id);
  }

  void dialogQuestion(String title, String msg, BuildContext context) {
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
            onPressed: () => Navigator.pop(context, 'Ya'),
            child: Text('Ya'),
          ),
        ],
      ),
    );
  }

  @override
  void onInit() {
    getData();
    dummyVideo = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    super.onInit();
  }
}
