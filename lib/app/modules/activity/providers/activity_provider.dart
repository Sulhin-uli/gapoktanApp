import 'dart:io';

import 'package:get/get.dart';

import '../models/activity_model.dart';

class ActivityProvider extends GetConnect {
  String url = "http://192.168.43.38:8001/api/activity/";

  Future<dynamic> fetchData() async {
    final response = await get('$url');
    return response.body;
  }

  Future<dynamic> postData(
    int userId,
    int categoryActivityId,
    String title,
    String desc,
  ) async {
    try {
      final form = FormData({
        "user_id": userId,
        "category_activity_id": categoryActivityId,
        "title": title,
        "desc": desc,
      });

      final response = await post('$url', form);
      if (response.status.hasError) {
        return Future.error(response.body);
      } else {
        return response.body;
      }
    } catch (e) {
      return Future.error(ever.toString());
    }
  }

  Future<void> updateData(
    int id,
    int userId,
    int categoryActivityId,
    String title,
    String desc,
  ) async {
    final response = await put(
      '$url' + '$id',
      {
        "user_id": userId,
        "category_activity_id": categoryActivityId,
        "title": title,
        "desc": desc,
      },
    );
    return response.body;
  }

  Future<void> deleteData(int? id) async => await delete('$url' + '$id');
}
