import 'package:gapoktan_app/app/modules/edukasi/views/add_view.dart';
import 'package:gapoktan_app/app/modules/edukasi/views/detail_view.dart';
import 'package:gapoktan_app/app/modules/edukasi/views/edit_view.dart';
import 'package:get/get.dart';

import '../modules/edukasi/bindings/edukasi_binding.dart';
import '../modules/edukasi/views/edukasi_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kegiatan/bindings/kegiatan_binding.dart';
import '../modules/kegiatan/views/kegiatan_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/poktan/bindings/poktan_binding.dart';
import '../modules/poktan/views/poktan_view.dart';
import '../modules/produk/bindings/produk_binding.dart';
import '../modules/produk/views/produk_view.dart';
import '../modules/tandur/bindings/tandur_binding.dart';
import '../modules/tandur/views/tandur_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),

    // Edukasi
    GetPage(
      name: _Paths.EDUKASI,
      page: () => EdukasiView(),
      binding: EdukasiBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_EDUKASI,
      page: () => DetailView(),
      binding: EdukasiBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EDUKASI,
      page: () => AddView(),
      // binding: EdukasiBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_EDUKASI,
      page: () => EditView(),
      // binding: EdukasiBinding(),
    ),

    // Produk
    GetPage(
      name: _Paths.PRODUK,
      page: () => ProdukView(),
      binding: ProdukBinding(),
    ),

    GetPage(
      name: _Paths.KEGIATAN,
      page: () => KegiatanView(),
      binding: KegiatanBinding(),
    ),
    GetPage(
      name: _Paths.TANDUR,
      page: () => TandurView(),
      binding: TandurBinding(),
    ),

    // Poktan
    GetPage(
      name: _Paths.POKTAN,
      page: () => PoktanView(),
      binding: PoktanBinding(),
    ),
  ];
}
