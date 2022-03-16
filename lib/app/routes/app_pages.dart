import 'package:gapoktan_app/app/modules/edukasi/views/add_edukasi_view.dart';
import 'package:gapoktan_app/app/modules/edukasi/views/detail_edukasi_view.dart';
import 'package:gapoktan_app/app/modules/edukasi/views/edit_edukasi_view.dart';
import 'package:gapoktan_app/app/modules/kegiatan/views/add_kegiatan_view.dart';
import 'package:gapoktan_app/app/modules/kegiatan/views/detail_kegiatan_view.dart';
import 'package:gapoktan_app/app/modules/kegiatan/views/edit_kegiatan_view.dart';
import 'package:gapoktan_app/app/modules/produk/views/add_produk_view.dart';
import 'package:gapoktan_app/app/modules/produk/views/detail_produk.dart';
import 'package:gapoktan_app/app/modules/produk/views/edit_produk_view.dart';
import 'package:get/get.dart';

import '../modules/edukasi/bindings/edukasi_binding.dart';
import '../modules/edukasi/views/index_edukasi_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kegiatan/bindings/kegiatan_binding.dart';
import '../modules/kegiatan/views/index_kegiatan_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/poktan/bindings/poktan_binding.dart';
import '../modules/poktan/views/poktan_view.dart';
import '../modules/produk/bindings/produk_binding.dart';
import '../modules/produk/views/index_produk_view.dart';
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
      name: _Paths.INDEX_EDUKASI,
      page: () => IndexEdukasiView(),
      binding: EdukasiBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_EDUKASI,
      page: () => DetailEdukasiView(),
      binding: EdukasiBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EDUKASI,
      page: () => AddEdukasiView(),
      // binding: EdukasiBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_EDUKASI,
      page: () => EditEdukasiView(),
      // binding: EdukasiBinding(),
    ),

    // Produk
    GetPage(
      name: _Paths.INDEX_PRODUK,
      page: () => IndexProdukView(),
      binding: ProdukBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUK,
      page: () => DetailProdukView(),
      binding: ProdukBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUK,
      page: () => AddProdukView(),
      // binding: PRODUKBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PRODUK,
      page: () => EditProdukView(),
      // binding: EdukasiBinding(),
    ),

    // Kegiatan
    GetPage(
      name: _Paths.INDEX_KEGIATAN,
      page: () => IndexKegiatanView(),
      // binding: ProdukBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_KEGIATAN,
      page: () => DetailKegiatanView(),
      binding: KegiatanBinding(),
    ),
    GetPage(
      name: _Paths.ADD_KEGIATAN,
      page: () => AddKegiatanView(),
      // binding: PRODUKBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_KEGIATAN,
      page: () => EditKegiatanView(),
      // binding: EdukasiBinding(),
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
