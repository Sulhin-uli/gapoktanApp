import 'package:flutter/material.dart';
import 'package:format_indonesia/format_indonesia.dart';
import 'package:intl/intl.dart';
import 'package:gapoktan_app/app/modules/tandur/controllers/tandur_controller.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

class DetailTandurView extends GetView<TandurController> {
  @override
  Widget build(BuildContext context) {
    final data = controller.findByidTandur(Get.arguments);
    DateTime datetime = DateTime.parse(data.platingDate!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Detail Tandur',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        leading: BackButton(color: Colors.black),
        elevation: 0.5,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.startupdonut.co.uk/sites/default/files/styles/landing_pages_lists/public/Guy_watson_249x167.png?itok=e_ct04Rx'),
                ),
                title: Text(data.farmerId!.userId!.name!),
              ),
              Divider(
                color: Colors.black.withOpacity(0.5),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Text(
                  "Detail",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 80,
                          child: Text(
                            "Tanaman",
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 50,
                          ),
                        ),
                        Container(
                          width: 150,
                          child: Text(
                            data.plantTanaman!,
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xff919A92),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 80,
                          child: Text(
                            "Luas Tanah",
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 50,
                          ),
                        ),
                        Container(
                          width: 150,
                          child: Text(
                            data.surfaceArea!,
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xff919A92),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 80,
                          child: Text(
                            "Tgl Tandur",
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 50,
                          ),
                        ),
                        Container(
                          width: 150,
                          child: Text(
                            Waktu(datetime).yMMMMEEEEd(),
                            style: TextStyle(
                              color: Color(0xff919A92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xff919A92),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 200,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
