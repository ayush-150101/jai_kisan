import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jai_kisan/models/item.dart';
import 'package:jai_kisan/models/product_description.dart';

class ItemController extends GetxController{

  String? farmingCategory;
  String? productCategory;

  List<Item> itemsOnDisplay = [];

  ItemController({this.farmingCategory,this.productCategory});

  @override
  void onInit() {
    super.onInit();
    if(farmingCategory!=null && productCategory!=null) {
      itemsOnDisplay = getItems(farmingCategory!,productCategory!);
    }
  }

  List<Item> itemsList = [
    Item(
      itemId: 1,
      name: "Gobor Sar",
      farmingCategory: 'Tea',
      productCategory: 'Fertilizers',
      price: 200,
      image: "assets/placeholder.png",
      description: ProductDescription(
        description: "This is product Description. Describe the product here",
        brand: "*** Brand ***",
        seller: "*** Seller ***",
        rating: 2.4,
      )
    ),
    Item(
        itemId: 2,
        name: "Pesticide",
        farmingCategory: 'Tea',
        productCategory: 'Fertilizers',
        price: 400,
        image: "assets/placeholder.png",
        description: ProductDescription(
          description: "This is product Description. Describe the product here",
          brand: "*** Brand ***",
          seller: "*** Seller ***",
          rating: 2.4,
        )
    ),
    Item(
        itemId: 3,
        name: "Vermi Compost",
        farmingCategory: 'Tea',
        productCategory: 'Fertilizers',
        price: 600,
        image: "assets/placeholder.png",
        description: ProductDescription(
          description: "This is product Description. Describe the product here",
          brand: "*** Brand ***",
          seller: "*** Seller ***",
          rating: 2.4,
        )
    ),
    Item(
        itemId: 4,
        name: "Seeds",
        farmingCategory: 'Tea',
        productCategory: 'Fertilizers',
        price: 500,
        image: "assets/placeholder.png",
        description: ProductDescription(
          description: "This is product Description. Describe the product here",
          brand: "*** Brand ***",
          seller: "*** Seller ***",
          rating: 2.4,
        )
    ),
    Item(
        itemId: 5,
        name: "Rake",
        farmingCategory: 'Tea',
        productCategory: 'Equipments',
        price: 500,
        image: "assets/placeholder.png",
        description: ProductDescription(
          description: "This is product Description. Describe the product here",
          brand: "*** Brand ***",
          seller: "*** Seller ***",
          rating: 2.4,
        )
    ),
    Item(
        itemId: 6,
        name: "Sickle",
        farmingCategory: 'Tea',
        productCategory: 'Equipments',
        price: 1000,
        image: "assets/placeholder.png",
        description: ProductDescription(
          description: "This is product Description. Describe the product here",
          brand: "*** Brand ***",
          seller: "*** Seller ***",
          rating: 2.4,
        )
    ),
    Item(
        itemId: 7,
        name: "Pickaxe",
        farmingCategory: 'Tea',
        productCategory: 'Equipments',
        price: 1500,
        image: "assets/placeholder.png",
        description: ProductDescription(
          description: "This is product Description. Describe the product here",
          brand: "*** Brand ***",
          seller: "*** Seller ***",
          rating: 2.4,
        )
    ),
    Item(
        itemId: 8,
        name: "Pawda",
        farmingCategory: 'Tea',
        productCategory: 'Equipments',
        price: 1300,
        image: "assets/placeholder.png",
        description: ProductDescription(
          description: "This is product Description. Describe the product here",
          brand: "*** Brand ***",
          seller: "*** Seller ***",
          rating: 2.4,
        )
    ),

  ];

  List<Item> getItems(String fc, String pc){
    return itemsList.where((element) => (element.farmingCategory == fc && element.productCategory == pc)).toList();
  }

  void addItem(Item item){
    itemsList.add(item);
  }

  Item getItemByid(int id){
    return itemsList.firstWhere((element) => element.itemId == id);
  }

  List<Item> getItemByCategory(String farmingCategory, String productCategory){

    return itemsList.where((element) => (element.farmingCategory == farmingCategory && element.productCategory == productCategory)).toList();

  }

}