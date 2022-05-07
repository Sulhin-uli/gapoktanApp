import 'dart:io';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../models/education_model.dart';

class EducationProvider extends GetConnect {
  String url = "http://192.168.43.38:8001/api/education";

  Future<dynamic> fetchData() async {
    // Printing is nice, but we want these messages in the UI
    try {
      final response = await get('$url');
      return response.body;
    } on SocketException {
      print('No Internet connection ');
    } on HttpException {
      print("Couldn't find the post  ");
    } on FormatException {
      print("Bad response format  ");
    }
  }

  Future<dynamic> postData(
    int userId,
    int categoryEducationId,
    String title,
    File file,
    String desc,
  ) async {
    try {
      final form = FormData({
        "user_id": userId,
        "category_education_id": categoryEducationId,
        "title": title,
        // "file": file,
        'file': MultipartFile(file, filename: 'aa.jpg'),
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
    // final response = await post(
    //   '$url',
    //   {
    //     "user_id": userId,
    //     "category_education_id": categoryEducationId,
    //     "title": title,
    //     "file": file,
    //     "desc": desc,
    //   },
    // );
    // return response.body;
  }

  Future<void> updateData(
    int id,
    int user_id,
    String category_education_id,
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

  Future<void> deleteData(int? id) async => await delete('$url/' + '$id');
}
