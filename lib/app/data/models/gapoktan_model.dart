import 'package:gapoktan_app/app/data/models/user_model.dart';

class Gapoktan {
  int? id;
  User? userId;
  String? city;
  String? address;
  int? telp;
  String? image;
  int? isActive;

  Gapoktan({
    this.id,
    this.userId,
    this.city,
    this.address,
    this.telp,
    this.image,
    this.isActive,
  });

  Gapoktan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId =
        json['user_id'] != null ? new User.fromJson(json['user_id']) : null;
    city = json['city'];
    address = json['address'];
    telp = json['telp'];
    image = json['image'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    if (userId != null) {
      data['user_id'] = userId!.toJson();
    }
    data['city'] = city;
    data['address'] = address;
    data['telp'] = telp;
    data['image'] = image;
    data['isActive'] = isActive;
    return data;
  }
}
