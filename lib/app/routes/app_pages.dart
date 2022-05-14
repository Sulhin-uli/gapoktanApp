import 'package:gapoktan_app/app/modules/activity_category/views/add_category_activity_view.dart';
import 'package:gapoktan_app/app/modules/activity_category/views/edit_category_activity_view.dart';
import 'package:gapoktan_app/app/modules/education_category/views/add_category_education_view.dart';
import 'package:gapoktan_app/app/modules/education_category/views/edit_category_education_view.dart';
import 'package:get/get.dart';

import '../modules/activity/bindings/activity_binding.dart';
import '../modules/activity/bindings/form_activity_binding.dart';
import '../modules/activity/views/add_activity_view.dart';
import '../modules/activity/views/detail_activity_view.dart';
import '../modules/activity/views/edit_activity_view.dart';
import '../modules/activity/views/index_activity_view.dart';
import '../modules/activity_category/bindings/activity_category_binding.dart';
import '../modules/activity_category/views/activity_category_view.dart';
import '../modules/education/bindings/education_binding.dart';
import '../modules/education/bindings/form_education_binding.dart';
import '../modules/education/views/add_education_view.dart';
import '../modules/education/views/detail_education_view.dart';
import '../modules/education/views/edit_education_view.dart';
import '../modules/education/views/index_education_view.dart';
import '../modules/education_category/bindings/education_category_binding.dart';
import '../modules/education_category/views/education_category_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view_old.dart';
import '../modules/home/views/index_home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notifikasi/bindings/notifikasi_binding.dart';
import '../modules/notifikasi/views/index_notifikasi_view.dart';
import '../modules/panen/bindings/panen_binding.dart';
import '../modules/panen/views/detail_detail_view.dart';
import '../modules/panen/views/index_panen_view.dart';
import '../modules/poktan/bindings/poktan_binding.dart';
import '../modules/poktan/views/add_poktan_view.dart';
import '../modules/poktan/views/detail_poktan_view.dart';
import '../modules/poktan/views/edit_poktan_view.dart';
import '../modules/poktan/views/index_poktan_view.dart';
import '../modules/produk/bindings/produk_binding.dart';
import '../modules/produk/views/add_produk_view.dart';
import '../modules/produk/views/detail_produk.dart';
import '../modules/produk/views/edit_produk_view.dart';
import '../modules/produk/views/index_produk_view.dart';
import '../modules/saya/bindings/saya_binding.dart';
import '../modules/saya/views/index_saya_view.dart';
import '../modules/tandur/bindings/tandur_binding.dart';
import '../modules/tandur/views/detail_tandur_view.dart';
import '../modules/tandur/views/index_tandur_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => IndexHomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),

    // Edukasi
    GetPage(
      name: _Paths.INDEX_EDUCATION,
      page: () => IndexEducationView(),
      binding: EducationBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_EDUCATION,
      page: () => DetailEducationView(),
      binding: EducationBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EDUCATION,
      page: () => AddEducationView(),
      binding: FormEducationBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_EDUCATION,
      page: () => EditEducationView(),
      binding: FormEducationBinding(),
    ),
    // Edukasi Kategori
    GetPage(
      name: _Paths.ADD_EDUCATION_CATEGORY,
      page: () => AddCategoryEducationView(),
      binding: EducationCategoryBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_EDUCATION_CATEGORY,
      page: () => EditCategoryEducationView(),
      binding: EducationCategoryBinding(),
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
      name: _Paths.INDEX_ACTIVITY,
      page: () => IndexActivityView(),
      binding: ActivityBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ACTIVITY,
      page: () => DetailActivityView(),
      binding: ActivityBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ACTIVITY,
      page: () => AddActivityView(),
      binding: ActivityBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_ACTIVITY,
      page: () => EditActivityView(),
      binding: ActivityBinding(),
    ),
    // Kategori Kegiatan
    GetPage(
      name: _Paths.INDEX_ACTIVITY_CATEGORY,
      page: () => ActivityCategoryView(),
      binding: ActivityCategoryBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ACTIVITY_CATEGORY,
      page: () => AddCategoryActivityView(),
      binding: ActivityCategoryBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_ACTIVITY_CATEGORY,
      page: () => EditCategoryActivityView(),
      binding: ActivityCategoryBinding(),
    ),

    // Tandur
    GetPage(
      name: _Paths.INDEX_TANDUR,
      page: () => IndexTandurView(),
      binding: TandurBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TANDUR,
      page: () => DetailTandurView(),
      // binding: ProdukBinding(),
    ),
    GetPage(
      name: _Paths.INDEX_TANDUR,
      page: () => IndexTandurView(),
      binding: TandurBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TANDUR,
      page: () => DetailTandurView(),
      // binding: ProdukBinding(),
    ),

    // Panen
    GetPage(
      name: _Paths.INDEX_PANEN,
      page: () => IndexPanenView(),
      binding: PanenBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PANEN,
      page: () => DetailPanenView(),
      // binding: ProdukBinding(),
    ),

    // Poktan
    GetPage(
      name: _Paths.INDEX_POKTAN,
      page: () => IndexPoktanView(),
      binding: PoktanBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_POKTAN,
      page: () => DetailPoktanView(),
      binding: PoktanBinding(),
    ),
    GetPage(
      name: _Paths.ADD_POKTAN,
      page: () => AddPoktanView(),
      // binding: PRODUKBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_POKTAN,
      page: () => EditPoktanView(),
      // binding: EdukasiBinding(),
    ),
    GetPage(
      name: _Paths.INDEX_SAYA,
      page: () => IndexSayaView(),
      binding: SayaBinding(),
    ),
    GetPage(
      name: _Paths.INDEX_NOTIFIKASI,
      page: () => IndexNotifikasiView(),
      binding: NotifikasiBinding(),
    ),
    GetPage(
      name: _Paths.EDUCATION_CATEGORY,
      page: () => EducationCategoryView(),
      binding: EducationCategoryBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVITY_CATEGORY,
      page: () => ActivityCategoryView(),
      binding: ActivityCategoryBinding(),
    ),
  ];
}
