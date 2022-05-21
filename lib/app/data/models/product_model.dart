import 'package:gapoktan_app/app/data/models/product_category_model.dart';
import 'package:gapoktan_app/app/data/models/user_model.dart';

class Product {
  int? id;
  String? name;
  String? slug;
  String? image;
  ProductCategory? categoryProductId;
  String? code;
  int? stoke;
  int? price;
  String? desc;
  User? userId;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.categoryProductId,
      this.code,
      this.stoke,
      this.price,
      this.desc,
      this.userId,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    categoryProductId = json['category_product_id'] != null
        ? new ProductCategory.fromJson(json['category_product_id'])
        : null;
    code = json['code'];
    stoke = json['stoke'];
    price = json['price'];
    desc = json['desc'];
    userId =
        json['user_id'] != null ? new User.fromJson(json['user_id']) : null;
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image'] = this.image;
    if (this.categoryProductId != null) {
      data['category_product_id'] = this.categoryProductId!.toJson();
    }
    data['code'] = this.code;
    data['stoke'] = this.stoke;
    data['price'] = this.price;
    data['desc'] = this.desc;
    if (this.userId != null) {
      data['user_id'] = this.userId!.toJson();
    }
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
