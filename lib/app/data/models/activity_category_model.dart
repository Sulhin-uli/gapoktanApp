class ActivityCategory {
  int? id;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;

  ActivityCategory(
      {this.id, this.name, this.slug, this.createdAt, this.updatedAt});

  ActivityCategory.fromJson(Map<String, dynamic> json) {
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

  static List<ActivityCategory> fromJsonList(List data) {
    if (data == null || data.length == 0) return [];
    return data.map((e) => ActivityCategory.fromJson(e)).toList();
  }

  @override
  String toString() => name!;
}