import 'package:jai_kisan/models/product_description.dart';

class Item{

  int itemId;
  String name;
  String image;
  int price;
  String productCategory;
  String farmingCategory;
  ProductDescription description;

  Item({required this.itemId,required this.name,required this.image,required this.price,required this.productCategory,required this.farmingCategory,required this.description});

}