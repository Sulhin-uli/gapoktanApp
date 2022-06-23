import 'package:flutter/cupertino.dart';
import 'package:gapoktan_app/app/data/models/photo_product_model.dart';
import 'package:gapoktan_app/app/data/models/product_category_model.dart';
import 'package:gapoktan_app/app/data/models/product_model.dart';
import 'package:gapoktan_app/app/data/models/user_model.dart';
import 'package:gapoktan_app/app/data/providers/photo_product_provider.dart';
import 'package:gapoktan_app/app/data/providers/product_category_provider.dart';
import 'package:gapoktan_app/app/data/providers/product_provider.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';
import 'package:gapoktan_app/app/utils/constant.dart';
import 'package:get/get.dart';

class ProdukController extends GetxController {
  var carouselIndex = 0.obs;
  var resultSearch = false.obs;
  var product = List<Product>.empty().obs;
  var productCategory = List<ProductCategory>.empty().obs;
  var photoProduct = List<PhotoProduct>.empty().obs;
  var photoProductByProductId = List<PhotoProduct>.empty().obs;
  late TextEditingController seacrh;

  @override
  void onInit() {
    super.onInit();
    getDataCategory();
    getDataPhoto();
    getData();
    seacrh = TextEditingController();
  }

  void runSearch(String search) {
    if (search == "") {
      dialog("Peringatan", "Kolom tidak boleh kosong");
    } else {
      Get.toNamed(Routes.PRODUK);
    }
  }

  void getDataPhoto() async {
    PhotoProductProvider().getData().then((response) {
      try {
        response["data"].map((e) {
          final data = PhotoProduct(
            id: e["id"],
            productId: Product(
              id: e["product_id"]["id"],
              name: e["product_id"]["name"],
              slug: e["product_id"]["slug"],
              categoryProductId: ProductCategory(
                id: e["product_id"]["category_product_id"]["id"],
                name: e["product_id"]["category_product_id"]["name"],
                slug: e["product_id"]["category_product_id"]["slug"],
                createdAt: e["product_id"]["category_product_id"]["created_at"],
                updatedAt: e["product_id"]["category_product_id"]["updated_at"],
              ),
              code: e["product_id"]["code"],
              stoke: e["product_id"]["stoke"],
              price: e["product_id"]["price"],
              desc: e["product_id"]["desc"],
              userId: User(
                id: e["product_id"]["user_id"]["id"],
                name: e["product_id"]["user_id"]["name"],
              ),
              isActive: e["product_id"]["isActive"],
            ),
            name: e["name"],
            createdAt: e["created_at"],
            updatedAt: e["updated_at"],
          );
          photoProduct.add(data);
        }).toList();
      } catch (e) {
        print(e.toString());
      }
    });
  }

  // void getPhotoProductById(int productId) {
  //   for (var item in photoProduct) {
  //     print(photoProduct);
  //     // if (item.productId!.id == productId) {
  //     //   final data = PhotoProduct(
  //     //     id: item.id,
  //     //     productId: Product(
  //     //       id: item.productId!.id,
  //     //       name: item.productId!.name,
  //     //       slug: item.productId!.slug,
  //     //       categoryProductId: CategoryProduct(
  //     //         id: item.productId!.categoryProductId!.id,
  //     //         name: item.productId!.categoryProductId!.name,
  //     //         slug: item.productId!.categoryProductId!.slug,
  //     //         createdAt: item.productId!.categoryProductId!.createdAt,
  //     //         updatedAt: item.productId!.categoryProductId!.updatedAt,
  //     //       ),
  //     //       code: item.productId!.code,
  //     //       stoke: item.productId!.stoke,
  //     //       price: item.productId!.price,
  //     //       desc: item.productId!.desc,
  //     //       userId: UserModel(
  //     //         id: item.productId!.userId!.id,
  //     //         name: item.productId!.userId!.name,
  //     //       ),
  //     //       isActive: item.productId!.isActive,
  //     //     ),
  //     //     name: item.name,
  //     //     createdAt: item.createdAt,
  //     //     updatedAt: item.updatedAt,
  //     //   );
  //     //   photoProductByProductId.insert(0, data);
  //     // } else {
  //     //   print("not found");
  //     // }
  //   }
  // }

  void getData() async {
    ProductProvider().getData().then((response) {
      try {
        response["data"].map((e) {
          final data = Product(
            id: e["id"],
            name: e["name"],
            slug: e["slug"],
            categoryProductId: ProductCategory(
              id: e["category_product_id"]["id"],
              name: e["category_product_id"]["name"],
              slug: e["category_product_id"]["slug"],
              isActive: e["category_product_id"]["is_active"],
              createdAt: e["category_product_id"]["created_at"],
              updatedAt: e["category_product_id"]["updated_at"],
            ),
            code: e["code"],
            stoke: e["stoke"],
            price: e["price"],
            desc: e["desc"],
            userId: User(
              id: e["user_id"]["id"],
              name: e["user_id"]["name"],
            ),
            isActive: e["is_active"],
          );
          product.add(data);
        }).toList();
      } catch (e) {
        // Get.toNamed(Routes.ERROR, arguments: e.toString());
        print(e);
      }
    });
  }

  void getDataCategory() async {
    ProductCategoryProvider().getDatas().then((response) {
      try {
        response["data"].map((e) {
          final data = ProductCategory(
            id: e["id"],
            name: e["name"],
            slug: e["slug"],
            isActive: e["is_active"],
            createdAt: e["created_at"],
            updatedAt: e["updated_at"],
          );
          productCategory.add(data);
        }).toList();
      } catch (e) {
        // Get.toNamed(Routes.ERROR, arguments: e.toString());
        print(e);
      }
    });
  }

// cari berdasarka id
  Product findByid(int id) {
    return product.firstWhere((element) => element.id == id);
  }

  Product findBySlug(String slug) {
    return product.firstWhere((element) => element.slug == slug);
  }
}
