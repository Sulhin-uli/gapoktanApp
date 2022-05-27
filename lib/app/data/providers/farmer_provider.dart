import 'package:gapoktan_app/app/utils/base_url.dart';
import 'package:get/get.dart';

import '../models/plant_model.dart';

class FarmerProvider extends GetConnect {
  String url = baseUrl + "farmer";

  Future<dynamic> getData(
    String token,
  ) async {
    final response = await get('$url', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }
}
