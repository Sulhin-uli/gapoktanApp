class Activity {
  int? id;
  int? userId;
  int? categoryActivityId;
  String? title;
  String? slug;
  String? date;
  String? desc;
  String? createdAt;
  String? updatedAt;

  Activity(
      {this.id,
      this.userId,
      this.categoryActivityId,
      this.title,
      this.slug,
      this.date,
      this.desc,
      this.createdAt,
      this.updatedAt});

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryActivityId = json['category_activity_id'];
    // categoryActivityId = json['category_activity_id'] != null
    //     ? CategoryActivityId?.fromJson(json['category_activity_id'])
    //     : null;
    title = json['title'];
    slug = json['slug'];
    date = json['date'];
    desc = json['desc'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['category_activity_id'] = categoryActivityId;
    // if (categoryActivityId != null) {
    //   data['category_activity_id'] = categoryActivityId?.toJson();
    // }
    data['title'] = title;
    data['slug'] = slug;
    data['date'] = date;
    data['desc'] = desc;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class CategoryActivityId {
  int? id;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;

  CategoryActivityId(
      {this.id, this.name, this.slug, this.createdAt, this.updatedAt});

  CategoryActivityId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
