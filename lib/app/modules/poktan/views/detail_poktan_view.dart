import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/poktan/controllers/poktan_controller.dart';
import 'package:gapoktan_app/app/utils/base_url.dart';

import 'package:get/get.dart';

class DetailPoktanView extends GetView<PoktanController> {
  @override
  Widget build(BuildContext context) {
    final data = controller.findByid(Get.arguments);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Detail Poktan',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        leading: const BackButton(color: Colors.black),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: (data.image == null)
                    ? CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/noimage.png"),
                      )
                    : CircleAvatar(
                        backgroundImage: NetworkImage(
                          baseUrlFile + "storage/profile/" + data.image!,
                        ),
                      ),
                title: Text(data.userId!.name ?? ""),
              ),
              Divider(
                color: Colors.black.withOpacity(0.5),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: const Text(
                  "Detail Poktan",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 80,
                          child: Text(
                            "Nama Poktan",
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 50,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            data.userId!.name ?? "",
                            style: const TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color(0xff919A92),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 80,
                          child: Text(
                            "Nama Ketua",
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 50,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            data.chairman ?? "",
                            style: const TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color(0xff919A92),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 80,
                          child: Text(
                            "Telepon",
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 50,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            data.telp.toString() != null
                                ? data.telp.toString()
                                : "",
                            style: const TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color(0xff919A92),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 80,
                          child: Text(
                            "Alamat",
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 50,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            data.address ?? "",
                            style: const TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color(0xff919A92),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 80,
                          child: Text(
                            "Anggota Gapoktan",
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 50,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            data.gapoktanId!.userId!.name ?? "",
                            style: const TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color(0xff919A92),
                    ),
                    Container(
                      height: 200,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
