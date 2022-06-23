import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gapoktan_app/app/modules/education/controllers/education_controller.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

class SearchFormEducationiew extends GetView<EducationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
              controller.seacrh.clear();
            }),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Container(
          width: double.infinity,
          height: 47,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              controller: controller.seacrh,
              autofocus: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.grey[200],
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    controller.runSearch(controller.seacrh.text);
                  },
                ),
                hintText: 'Cari...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: Text(
                "Kategori",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.educationCategory
                  .where((e) => e.isActive == 1)
                  .length,
              itemBuilder: (context, i) {
                final data = controller.educationCategory[i];
                if (data.isActive == 1) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(Routes.BY_CATEGORY_EDUCATION,
                            arguments: data.name);
                      },
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black26,
                        child: Image.asset(
                          "assets/icons/kategori.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                      title: Text(
                        (data.name! != null) ? data.name! : "Kategori",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/empty-data.svg",
                          height: 100,
                          width: 100,
                        ),
                        Text(
                          "Data Tidak Ada",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
