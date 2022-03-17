import 'package:flutter/cupertino.dart';

class MenuHome {
  String? id;
  String? image;
  String? title;
  Color? color;

  MenuHome({this.id, this.image, this.title, this.color});

  MenuHome.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['color'] = color;
    return data;
  }
}
