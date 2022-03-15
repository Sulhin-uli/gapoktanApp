import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tandur_controller.dart';

class TandurView extends GetView<TandurController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TandurView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TandurView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
