import 'dart:io';

import 'package:get/get.dart';

import '../models/activity_model.dart';

class ActivityProvider extends GetConnect {
  String url = "http://192.168.43.38:8001/api/activity/";

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

  Future<dynamic> postData(
    int userId,
    int categoryActivityId,
    String title,
    String date,
    String desc,
    String token,
  ) async {
    final response = await post('$url', {
      "user_id": userId,
      "category_activity_id": categoryActivityId,
      "title": title,
      "date": date,
      "desc": desc,
    }, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return response.body;
  }

  Future<void> updateData(
    int id,
    int categoryActivityId,
    String title,
    String date,
    String desc,
    String token,
  ) async {
    final response = await put('$url' + '$id', {
      "category_activity_id": categoryActivityId,
      "title": title,
      "date": date,
      "desc": desc,
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
      await delete('$url' + '$id', headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
}
