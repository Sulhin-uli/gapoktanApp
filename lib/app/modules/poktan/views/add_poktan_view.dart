import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/poktan/controllers/poktan_controller.dart';

import 'package:get/get.dart';

class AddPoktanView extends GetView<PoktanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'Tambah Poktan',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nama",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.name,
                cursorColor: Color(0xff16A085),
                decoration: InputDecoration(
                  // helperText: 'Contoh: Label',
                  // fillColor: Color(0xff919A92),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff919A92),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff16A085),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Email",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              TextFormField(
                controller: controller.email,
                cursorColor: Color(0xff16A085),
                decoration: InputDecoration(
                  // helperText: 'Contoh: Label',
                  // fillColor: Color(0xff919A92),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff919A92),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff16A085),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Password",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  cursorColor: Color(0xff16A085),
                  obscureText: controller.hiddenTextPassword.value,
                  decoration: InputDecoration(
                    // fillColor: Color(0xff919A92),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff919A92),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff16A085),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hiddenTextPassword.toggle(),
                      icon: controller.hiddenTextPassword.isTrue
                          ? Icon(
                              Icons.remove_red_eye,
                              color: Color(0xff16A085),
                            )
                          : Icon(
                              Icons.remove_red_eye_outlined,
                              color: Color(0xff16A085),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Konfirmasi Password",
                style: TextStyle(
                  color: Color(0xff919A92),
                ),
              ),
              Obx(
                () => TextFormField(
                  controller: controller.password2,
                  cursorColor: Color(0xff16A085),
                  obscureText: controller.hiddenTextPassword2.value,
                  decoration: InputDecoration(
                    // fillColor: Color(0xff919A92),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff919A92),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff16A085),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hiddenTextPassword2.toggle(),
                      icon: controller.hiddenTextPassword2.isTrue
                          ? Icon(
                              Icons.remove_red_eye,
                              color: Color(0xff16A085),
                            )
                          : Icon(
                              Icons.remove_red_eye_outlined,
                              color: Color(0xff16A085),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  height: 46, //height of button
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff16A085), // background
                    ),
                    onPressed: () => controller.postData(
                        controller.name.text,
                        controller.email.text,
                        controller.password.text,
                        controller.password2.text),
                    child: Text('Tambah'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
