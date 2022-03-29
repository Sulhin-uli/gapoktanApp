import 'package:get/get.dart';

import '../models/education_model.dart';

class EducationProvider extends GetConnect {
  String url = "http://192.168.43.38:8001/api/education/";

  Future<dynamic> fetchData() async {
    final response = await get('$url');
    return response.body;
  }

  Future<dynamic> postData(
    int user_id,
    int category_education_id,
    String title,
    String file,
    String desc,
  ) async {
    final response = await post(
      '$url',
      {
        "user_id": user_id,
        "category_education_id": category_education_id,
        "title": title,
        "file": file,
        "desc": desc,
      },
    );
    return response.body;
  }

  Future<void> updateData(
    int id,
    int user_id,
    int category_education_id,
    String title,
    String file,
    String desc,
  ) async {
    final response = await put(
      '$url' + '$id',
      {
        "user_id": user_id,
        "category_education_id": category_education_id,
        "title": title,
        "file": file,
        "desc": desc,
      },
    );
    return response.body;
  }

  Future<void> deleteData(int? id) async => await delete('$url' + '$id');
}
