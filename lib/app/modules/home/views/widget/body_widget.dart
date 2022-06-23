import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/home/controllers/home_controller.dart';
import 'package:gapoktan_app/app/modules/login/controllers/login_controller.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';
import 'package:gapoktan_app/app/utils/constant.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'header_widget.dart';

class Body extends GetView<HomeController> {
  final box = GetStorage();
  final loginController = Get.find<LoginController>();
  final homeC = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final user = box.read("userData") as Map<String, dynamic>;
    // final data = controller.loginController.findGapoktan(user["id"]);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header(size: size, dataUserName: "Sulhin"),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              "Menu",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () => Get.toNamed(Routes.INDEX_EDUCATION),
                  child: menuVertical(
                      "Edukasi", const Color(0xff16A085), "edukasi.png"),
                ),
                InkWell(
                  onTap: () => Get.toNamed(Routes.INDEX_ACTIVITY),
                  child: menuVertical(
                      "Kegiatan", const Color(0xff16A085), "kegiatan.png"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () => Get.toNamed(Routes.SEARCH),
                  child: menuVertical(
                      "Produk", const Color(0xff16A085), "produk.png"),
                ),
                InkWell(
                  onTap: () => Get.toNamed(Routes.INDEX_POKTAN),
                  child: menuVertical(
                      "Poktan", const Color(0xff16A085), "poktan.png"),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Tanaman",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () => Get.toNamed(Routes.INDEX_TANDUR),
                  child: menuVertical(
                      "Jadwal Tandur", const Color(0xff16A085), "tandur.png"),
                ),
                InkWell(
                  onTap: () => Get.toNamed(Routes.INDEX_PANEN),
                  child: menuVertical(
                      "Jadwal Panen", const Color(0xff16A085), "panen.png"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () => Get.toNamed(Routes.HISTORY_PLANT),
                  child: menuVertical("Riwayat Penanaman",
                      const Color(0xff16A085), "history-penanaman.png"),
                ),
              ],
            ),
          ),
          const SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }

  Widget menuHorizontal(
      String name, String image, Color color, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: color.withOpacity(0.07),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: ListTile(
              leading: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueAccent,
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover)),
              ),
              title: Text(
                name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              trailing: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Center(
                      child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget menuVertical(String name, Color color, String image) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/icons/" + image,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
