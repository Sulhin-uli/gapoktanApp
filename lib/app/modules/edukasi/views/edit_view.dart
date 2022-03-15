import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EditView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff5D8BF4),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Title Edit",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        "Label",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff5D8BF4)),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[100],
                          filled: true),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        "Label",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff5D8BF4)),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey[100],
                          filled: true),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text('Update'),
                ),
              ),
            ],
          ),
        ));
  }
}
