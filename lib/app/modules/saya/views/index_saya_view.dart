import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/login/controllers/login_controller.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:avatar_glow/avatar_glow.dart';

import '../controllers/saya_controller.dart';

class IndexSayaView extends GetView<SayaController> {
  final loginC = Get.find<LoginController>();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    final user = box.read("userData") as Map<String, dynamic>;
    final data = loginC.findGapoktan(user["id"]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Center(
                    child: Stack(
                      children: <Widget>[
                        Obx(
                          () => AvatarGlow(
                            endRadius: 110,
                            glowColor: Colors.black,
                            duration: Duration(seconds: 2),
                            child: Container(
                              margin: EdgeInsets.all(15),
                              width: 175,
                              height: 175,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: controller
                                        .selectedImagePath.value.isImageFileName
                                    ? Image.file(
                                        File(
                                            controller.selectedImagePath.value),
                                      )
                                    : Image.asset(
                                        'assets/images/noimage.png',
                                        height: 150,
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 1,
                            right: 1,
                            child: InkWell(
                              onTap: () => controller.getImage(),
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    data.userId!.name!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                  children: const [
                    Divider(
                      color: Color(0xff919A92),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Kembali Ke Home'),
                    ),
                    Divider(
                      color: Color(0xff919A92),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 16,
                ),
                child: const Text(
                  "Aktivitas Saya",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.circle),
                title: Text('Title Menu'),
              ),
              const ListTile(
                leading: Icon(Icons.circle),
                title: Text('Title Menu'),
              ),
              const ListTile(
                leading: Icon(Icons.circle),
                title: Text('Title Menu'),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 16,
                ),
                child: const Text(
                  "Pengaturan Akun",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.person),
                title: Text('Ubah Akun'),
              ),
              const ListTile(
                leading: Icon(Icons.vpn_key),
                title: Text('Ubah Password'),
              ),
              GestureDetector(
                onTap: () {
                  box.erase();
                  Get.toNamed(Routes.LOGIN);
                },
                child: const ListTile(
                  leading: Icon(Icons.vpn_key),
                  title: Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
