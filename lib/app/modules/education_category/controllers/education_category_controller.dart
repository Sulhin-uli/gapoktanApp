import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/education_category/models/education_category_model.dart';
import 'package:gapoktan_app/app/modules/education_category/providers/education_category_provider.dart';
import 'package:get/get.dart';

class EducationCategoryController extends GetxController {
  // list education
  var education_category = List<EducationCategory>.empty().obs;
  // get name of category educatiom
  final getNameCategoryEducation = "".obs;
  // dropdown
  final selectedValue = "".obs;
  final selectedEditValue = "".obs;
  // loading
  var isLoading = true.obs;

  void onSelected(String value) {
    selectedValue.value = value;
    // registrationParam.value.roleType = selectedRole.value;
  }

  @override
  void onInit() {
    super.onInit();
    // panggil fetch data
    fetchData();
    // findByid(1);
  }

  // get data
  Future fetchData() async {
    return EducationCategoryProvider().fetchData().then((response) {
      for (var i = 0; i < response[0].length; i++) {
        final data = EducationCategory(
          id: response[0][i]["id"],
          name: response[0][i]["name"],
          createdAt: response[0][i]["created_at"],
          updatedAt: response[0][i]["updated_at"],
        );
        education_category.add(data);
      }
      selectedValue.value = education_category[0].id.toString();
      // selectedEditValue.value = education_category[0].id.toString();
    });
  }

  void changeEditCategory(int id) {
    selectedEditValue.value = findByid(id).id!.toString();
  }

  EducationCategory findByid(int id) {
    // try {
    //   isLoading(true);
    //   return education_category.firstWhere((element) => element.id == id);
    // } catch (e) {}
    return education_category.firstWhere((element) => element.id == id);
  }

  Future getNameCategory(int id) async {
    var name = await findByid(id).name;
    getNameCategoryEducation.value = name!;
  }

  // dropdown
  List<DropdownMenuItem<String>> addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<int> getDividersIndexes() {
    List<int> _dividersIndexes = [];
    for (var i = 0; i < (education_category.length * 2) - 1; i++) {
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _dividersIndexes.add(i);
      }
    }
    return _dividersIndexes;
  }
}
