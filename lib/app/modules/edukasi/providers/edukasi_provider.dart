import 'package:get/get.dart';

import '../models/edukasi_model.dart';

class EdukasiProvider extends GetConnect {
  String url = "http://10.0.113.84:8001/api/education";

  Future<dynamic> fetchData() async {
    final response = await get('$url');
    return response.body;
  }
}
