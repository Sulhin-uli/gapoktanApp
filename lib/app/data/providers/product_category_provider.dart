import 'package:gapoktan_app/app/utils/base_url.dart';
import 'package:get/get.dart';

class ProductCategoryProvider extends GetConnect {
  String url = baseUrl + "product-category";

  Future<dynamic> postData(
    String name,
    String token,
  ) async {
    final response = await post(url, {
      "name": name,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<dynamic> getData(
    String token,
  ) async {
    final response = await get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    return response.body;
  }

  Future<void> updateData(
    int id,
    String name,
    String token,
  ) async {
    final response = await put(url + '/$id', {
      "id": id,
      "name": name,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<void> deleteData(
    int? id,
    String token,
  ) async =>
      await delete(url + '/$id', headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

  Future<dynamic> getDatas() async {
    final response = await get('$url');
    return response.body;
  }
}
