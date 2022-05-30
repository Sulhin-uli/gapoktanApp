import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gapoktan_app/app/data/models/farmer_model.dart';
import 'package:gapoktan_app/app/data/models/plant_model.dart';
import 'package:gapoktan_app/app/data/models/poktan_model.dart';
import 'package:gapoktan_app/app/data/models/user_model.dart';
import 'package:gapoktan_app/app/data/providers/farmer_provider.dart';
import 'package:gapoktan_app/app/data/providers/plant_provider.dart';
import 'package:gapoktan_app/app/utils/constant.dart';

class TandurController extends GetxController {
  final box = GetStorage();
  var plantTandur = List<Plant>.empty().obs;
  var plantPanen = List<Plant>.empty().obs;
  var plantAll = List<Plant>.empty().obs;
  var farmer = List<Farmer>.empty().obs;

  void onInit() {
    getDataTandur();
    getDataPanen();
    getDataAll();
    final data = box.read("userData") as Map<String, dynamic>;
    // print(plant[0].farmerId!.poktanId!.gapoktanId!.id);
    // getDataByIdGapoktan(data["gapoktan_id"]);
    // if (plant[0].farmerId!.poktanId!.gapoktanId!.id == data["gapoktan_id"]) {
    //   print("exist");
    // }
    super.onInit();
  }

  Future getDataAll() async {
    final data = box.read("userData") as Map<String, dynamic>;
    return PlantProvider().getData(data["token"]).then((response) {
      try {
        response["data"].map((e) {
          final data = Plant(
            id: e["id"],
            farmerId: Farmer(
              id: e["farmer_id"]["id"],
              userId: User(
                id: e["farmer_id"]["user_id"]["id"],
                name: e["farmer_id"]["user_id"]["name"],
              ),
              city: e["farmer_id"]["city"],
            ),
            poktanId: Poktan(
              id: e["farmer_id"]["poktan_id"]["id"],
            ),
            plantTanaman: e["plant_tanaman"],
            surfaceArea: e["surface_area"],
            platingDate: e["plating_date"],
            harvestDate: e["harvest_date"],
            createdAt: e["created_at"],
            updatedAt: e["updated_at"],
          );
          plantAll.add(data);
        }).toList();
      } catch (e) {
        print("Error is : " + e.toString());
      }
    });
  }

  Future getDataTandur() async {
    final data = box.read("userData") as Map<String, dynamic>;
    return PlantProvider().getData(data["token"]).then((response) {
      try {
        response["data"].map((e) {
          if (e["farmer_id"]["poktan_id"]["gapoktan_id"]["id"] ==
              data["gapoktan_id"]) {
            if (e["status"] == "tandur") {
              final data = Plant(
                id: e["id"],
                farmerId: Farmer(
                  id: e["farmer_id"]["id"],
                  userId: User(
                    id: e["farmer_id"]["user_id"]["id"],
                    name: e["farmer_id"]["user_id"]["name"],
                  ),
                  city: e["farmer_id"]["city"],
                ),
                poktanId: Poktan(
                  id: e["farmer_id"]["poktan_id"]["id"],
                ),
                plantTanaman: e["plant_tanaman"],
                surfaceArea: e["surface_area"],
                platingDate: e["plating_date"],
                harvestDate: e["harvest_date"],
                createdAt: e["created_at"],
                updatedAt: e["updated_at"],
              );
              plantTandur.add(data);
            }
          }
        }).toList();
      } catch (e) {
        print("Error is : " + e.toString());
      }
    });
  }

  Future getDataPanen() async {
    final data = box.read("userData") as Map<String, dynamic>;
    return PlantProvider().getData(data["token"]).then((response) {
      try {
        response["data"].map((e) {
          if (e["farmer_id"]["poktan_id"]["gapoktan_id"]["id"] ==
              data["gapoktan_id"]) {
            if (e["status"] == "panen") {
              final data = Plant(
                id: e["id"],
                farmerId: Farmer(
                  id: e["farmer_id"]["id"],
                  userId: User(
                    id: e["farmer_id"]["user_id"]["id"],
                    name: e["farmer_id"]["user_id"]["name"],
                  ),
                  city: e["farmer_id"]["city"],
                ),
                poktanId: Poktan(
                  id: e["farmer_id"]["poktan_id"]["id"],
                ),
                plantTanaman: e["plant_tanaman"],
                surfaceArea: e["surface_area"],
                platingDate: e["plating_date"],
                harvestDate: e["harvest_date"],
                createdAt: e["created_at"],
                updatedAt: e["updated_at"],
              );
              plantPanen.add(data);
            }
          }
        }).toList();
      } catch (e) {
        print("Error is : " + e.toString());
      }
    });
  }

  // cari berdasarka id
  Plant findByidTandur(int id) {
    return plantTandur.firstWhere((element) => element.id == id);
  }

  Plant findByidPanen(int id) {
    return plantPanen.firstWhere((element) => element.id == id);
  }
}
