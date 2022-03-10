import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategoryController extends GetxController{

  List<Map<String,dynamic>> viewCategories = [];
  String farmingCategory;

  ProductCategoryController({required this.farmingCategory});

  @override
  void onInit() {
    super.onInit();
    viewCategories = getCategories(farmingCategory);
  }

  List<Map<String, dynamic>> categories = [
    {
      "farmingCategory":"Tea",
      "productCategory":"Equipments",
      "imageName": "assets/equipments.png"
    },
    {
      "farmingCategory":"Tea",
      "productCategory":"Fertilizers",
      "imageName": "assets/fertilizer.jpg"
    },
    {
      "farmingCategory":"Tea",
      "productCategory":"Medicines",
      "imageName": "assets/medicines.png"
    },
    {
      "farmingCategory":"Tea",
      "productCategory":"Seeds",
      "imageName": "assets/seeds.jpg"
    },
  ];

  List<Map<String, dynamic>> getCategories(String farmingCategory){
    return categories.where((element) => element['farmingCategory'] == farmingCategory).toList();
  }

}