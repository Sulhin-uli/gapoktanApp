import 'package:flutter_icons/flutter_icons.dart';
import 'package:gapoktan_app/app/modules/education/views/index_education_view.dart';
import 'package:gapoktan_app/app/modules/home/views/widget/carousel_widget.dart';
import 'package:gapoktan_app/app/modules/home/views/widget/time_weather_widget.dart';
import 'package:gapoktan_app/app/modules/produk/views/index_produk_view.dart';
import 'package:gapoktan_app/app/modules/saya/views/index_saya_view.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // Part Scrroll
    final _scrollController = TrackingScrollController();

    return Scaffold(
      bottomNavigationBar: buildBottomNavigationMenu(context, controller),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Image.asset(
            //   'assets/logo/logo.png',
            //   width: 200,
            //   height: 200,
            // ),
            Text(
              "GapoktanKula",
              style: TextStyle(color: Color(0xff16A085), fontSize: 18.0),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.INDEX_NOTIFIKASI),
            icon: Icon(
              // Icons.notifications,
              Ionicons.md_notifications,
              color: Color(0xff16A085),
            ),
          ),
        ],
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: [
            Stack(
              children: [
                // Container(
                //   height: 150.0,
                //   decoration: new BoxDecoration(
                //     color: Color(0xff16A085),
                //     borderRadius: new BorderRadius.vertical(
                //       bottom: new Radius.elliptical(
                //           MediaQuery.of(context).size.width, 100.0),
                //     ),
                //   ),
                // ),
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      TimeWeather(),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              color: Colors.red,
                              child: ListTile(
                                leading:
                                    Icon(Icons.circle, color: Colors.green),
                                title: const Text('Edukasi'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Title",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () =>
                                    Get.toNamed(Routes.INDEX_PRODUK),
                                child: Text(
                                  "Lihat Semua",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff16A085),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Carousel(),
                    ],
                  ),
                ),
              ],
            ),
            IndexProdukView(),
            IndexEducationView(),
            IndexSayaView()
          ],
        ),
      ),
    );
  }

  // Icon

  // Tabbar Bottom
  final TextStyle unselectedLabelStyle = TextStyle(
    color: Colors.white.withOpacity(0.5),
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
            unselectedItemColor: Colors.grey,
            selectedItemColor: Color(0xff16A085),
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.shopping_cart,
                    size: 20.0,
                  ),
                ),
                label: 'Produk',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.video_library,
                    size: 20.0,
                  ),
                ),
                label: 'Edukasi',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.person,
                    size: 20.0,
                  ),
                ),
                label: 'Saya',
                backgroundColor: Colors.white,
              ),
            ],
          ),
        )));
  }
}
