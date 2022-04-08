import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/education_category_controller.dart';

class EducationCategoryView extends GetView<EducationCategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EducationCategoryView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EducationCategoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
