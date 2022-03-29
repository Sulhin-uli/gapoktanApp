class Edukasi {
  int? id;
  int? userId;
  int? categoryEducationId;
  String? title;
  String? slug;
  String? date;
  String? file;
  String? desc;
  String? createdAt;
  String? updatedAt;

  Edukasi(
      {this.id,
      this.userId,
      this.categoryEducationId,
      this.title,
      this.slug,
      this.date,
      this.file,
      this.desc,
      this.createdAt,
      this.updatedAt});

  Edukasi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryEducationId = json['category_education_id'];
    title = json['title'];
    slug = json['slug'];
    date = json['date'];
    file = json['file'];
    desc = json['desc'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['category_education_id'] = categoryEducationId;
    data['title'] = title;
    data['slug'] = slug;
    data['date'] = date;
    data['file'] = file;
    data['desc'] = desc;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
