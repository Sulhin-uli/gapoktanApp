import 'package:get/get.dart';

import '../models/education_category_model.dart';

class EducationCategoryProvider extends GetConnect {
  String url = "http://192.168.43.38:8001/api/education-category/";

  Future<dynamic> fetchData() async {
    final response = await get('$url');
    return response.body;
  }
}
