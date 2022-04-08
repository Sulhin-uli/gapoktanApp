import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/education/controllers/education_controller.dart';
import 'package:gapoktan_app/app/modules/education/models/education_model.dart';
import 'package:gapoktan_app/app/modules/education_category/controllers/education_category_controller.dart';
import 'package:gapoktan_app/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class DetailEducationView extends GetView<EducationController> {
  final educationCategoryC = Get.find<EducationCategoryController>();

  @override
  Widget build(BuildContext context) {
    final data = controller.findByid(Get.arguments);
    // final dataC = educationCategoryC.findByid(data.categoryEducationId!);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.education.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Hero(
                        //   tag: "data.slug!",
                        //   child: Center(
                        //     child: Image.network(
                        //       "https://www.thehindu.com/sci-tech/agriculture/87sx5z/article30131510.ece/alternates/LANDSCAPE_615/NEWS2FARMER",
                        //     ),
                        //   ),
                        // ),
                        Hero(
                          tag: "data.slug!",
                          child: controller.cheviewController != null &&
                                  controller.cheviewController!
                                      .videoPlayerController.value.isInitialized
                              ? AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: Chewie(
                                      controller:
                                          controller.cheviewController!))
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(),
                                  ],
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(17, 17, 17, 0),
                          child: Text(
                            data.title!,
                            // "Greyhound divisively hello coldly wonderfully",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(17, 10, 17, 0),
                        //   child: Text(
                        //     "data.author!",
                        //     style: TextStyle(
                        //       color: Colors.red,
                        //       fontSize: 12.0,
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(17, 1, 17, 2),
                          child: Text(
                            data.date!,
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        Obx(
                          () => educationCategoryC.isLoading.isFalse
                              ? Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(17, 1, 17, 2),
                                  child: Text(
                                    educationCategoryC
                                        .findByid(data.categoryEducationId!)
                                        .name!,
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                )
                              : Center(
                                  child: CircularProgressIndicator(),
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(17, 5, 17, 0),
                          child: Text(data.desc!,
                              // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 14.0, height: 1.5)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 22.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 22),
                    alignment: Alignment.topRight,
                    child: PopupMenuButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                        PopupMenuItem(
                          child: ListTile(
                            onTap: () {
                              Navigator.pop(context, false);
                              Get.toNamed(Routes.EDIT_EDUCATION,
                                  arguments: data.id);
                            },
                            leading: Icon(Icons.edit),
                            title: Text('Ubah'),
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            onTap: () {
                              Navigator.pop(context, false);
                              controller.dialogDelete(data.id!, context);
                            },
                            leading: Icon(Icons.delete),
                            title: Text('Delete'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
