import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/login/controllers/authcontroller_controller.dart';
import 'package:gapoktan_app/app/utils/error_screen.dart';
import 'package:gapoktan_app/app/utils/loading_screen.dart';
import 'package:gapoktan_app/app/utils/splash_screen.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp()
      // GetMaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   title: "Application",
      //   initialRoute: AppPages.INITIAL,
      //   getPages: AppPages.routes,
      //   theme: ThemeData(
      //     primaryColor: const Color(0xff16A085),
      //   ),
      // ),
      );
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthcontrollerController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorScreen();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return FutureBuilder(
            future: Future.delayed(Duration(seconds: 3)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "Gapoktan",
                  initialRoute:
                      authC.isAuth.isTrue ? Routes.HOME : Routes.LOGIN,
                  theme: ThemeData(
                    primarySwatch: Colors.green,
                  ),
                  getPages: AppPages.routes,
                );
              }

              return SplashScreen();
            },
          );
        }

        return LoadingScreen();
      },
    );
  }
}
